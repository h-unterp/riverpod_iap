import 'dart:async';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:in_app_purchase_storekit/in_app_purchase_storekit.dart';
import 'package:in_app_purchase_storekit/store_kit_wrappers.dart';

import 'consumable_store.dart';

part 'iap_provider.freezed.dart';

// Auto-consume must be true on iOS.
// To try without auto-consume on another platform, change `true` to `false` here.
final bool _kAutoConsume = Platform.isIOS || true;

@freezed
class IAPState with _$IAPState {
  const factory IAPState(
      {@Default([]) List<String> notFoundIds,
      @Default(<ProductDetails>[]) List<ProductDetails> products,
      @Default(<PurchaseDetails>[]) List<PurchaseDetails> purchases,
      @Default(<String>[]) List<String> consumables,
      @Default(false) bool isAvailable,
      @Default(false) bool purchasePending}) = _IAPState;
}

final iapProvider =
    StateNotifierProvider<IAPNotifier, AsyncValue<IAPState>>((ref) {
  return IAPNotifier();
});

class IAPNotifier extends StateNotifier<AsyncValue<IAPState>> {
  final InAppPurchase _inAppPurchase = InAppPurchase.instance;
  late StreamSubscription<List<PurchaseDetails>> _subscription;

  IAPNotifier() : super(const AsyncLoading()) {
    initState();
  }

  void initState() {
    final Stream<List<PurchaseDetails>> purchaseUpdated =
        _inAppPurchase.purchaseStream;
    _subscription =
        purchaseUpdated.listen((List<PurchaseDetails> purchaseDetailsList) {
      _listenToPurchaseUpdated(purchaseDetailsList);
    }, onDone: () {
      _subscription.cancel();
    }, onError: (Object error) {
      state = AsyncError("error: $error");
    });
    initStoreInfo();
  }

  Future<void> initStoreInfo() async {
    final bool isAvailable = await _inAppPurchase.isAvailable();
    if (!isAvailable) {
      state = AsyncValue.data(IAPState(isAvailable: isAvailable));
      return;
    }

    if (Platform.isIOS) {
      final InAppPurchaseStoreKitPlatformAddition iosPlatformAddition =
          _inAppPurchase
              .getPlatformAddition<InAppPurchaseStoreKitPlatformAddition>();
      await iosPlatformAddition.setDelegate(ExamplePaymentQueueDelegate());
    }

    final ProductDetailsResponse productDetailResponse =
        await _inAppPurchase.queryProductDetails({"consumable"});
    if (productDetailResponse.error != null) {
      state = AsyncValue.error(productDetailResponse.error!.message);
      return;
    }

    if (productDetailResponse.productDetails.isEmpty) {
      state = const AsyncValue.error("empty");
      return;
    }

    final List<String> consumables = await ConsumableStore.load();
    state = AsyncValue.data(IAPState(
        isAvailable: isAvailable,
        products: productDetailResponse.productDetails,
        consumables: consumables));
  }

  Future<void> consume(String id) async {
    state = const AsyncLoading();
    await ConsumableStore.consume(id);
    final List<String> consumables = await ConsumableStore.load();
    state = AsyncValue.data(IAPState(consumables: consumables));
  }

  Future<void> deliverProduct(PurchaseDetails purchaseDetails) async {
    // IMPORTANT!! Always verify purchase details before delivering the product.
    await ConsumableStore.save(purchaseDetails.purchaseID!);
    final List<String> consumables = await ConsumableStore.load();
  }

  void handleError(IAPError error) {
    state = AsyncValue.error(error.message);
  }

  Future<bool> _verifyPurchase(PurchaseDetails purchaseDetails) {
    // IMPORTANT!! Always verify a purchase before delivering the product.
    // For the purpose of an example, we directly return true.
    return Future<bool>.value(true);
  }

  void _handleInvalidPurchase(PurchaseDetails purchaseDetails) {
    // handle invalid purchase here if  _verifyPurchase` failed.
  }

  Future<void> _listenToPurchaseUpdated(
      List<PurchaseDetails> purchaseDetailsList) async {
    for (final PurchaseDetails purchaseDetails in purchaseDetailsList) {
      if (purchaseDetails.status == PurchaseStatus.pending) {
        state = const AsyncLoading();
      } else {
        if (purchaseDetails.status == PurchaseStatus.error) {
          handleError(purchaseDetails.error!);
        } else if (purchaseDetails.status == PurchaseStatus.purchased ||
            purchaseDetails.status == PurchaseStatus.restored) {
          final bool valid = await _verifyPurchase(purchaseDetails);
          if (valid) {
            deliverProduct(purchaseDetails);
          } else {
            _handleInvalidPurchase(purchaseDetails);
            return;
          }
        }

        if (purchaseDetails.pendingCompletePurchase) {
          await _inAppPurchase.completePurchase(purchaseDetails);
        }
      }
    }
  }

  @override
  void dispose() {
    if (Platform.isIOS) {
      final InAppPurchaseStoreKitPlatformAddition iosPlatformAddition =
          _inAppPurchase
              .getPlatformAddition<InAppPurchaseStoreKitPlatformAddition>();
      iosPlatformAddition.setDelegate(null);
    }
    _subscription.cancel();
    super.dispose();
  }
}

/// Example implementation of the
/// [`SKPaymentQueueDelegate`](https://developer.apple.com/documentation/storekit/skpaymentqueuedelegate?language=objc).
///
/// The payment queue delegate can be implementated to provide information
/// needed to complete transactions.
class ExamplePaymentQueueDelegate implements SKPaymentQueueDelegateWrapper {
  @override
  bool shouldContinueTransaction(
      SKPaymentTransactionWrapper transaction, SKStorefrontWrapper storefront) {
    return true;
  }

  @override
  bool shouldShowPriceConsent() {
    return false;
  }
}
