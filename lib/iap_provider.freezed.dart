// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'iap_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$IAPState {
  List<String> get notFoundIds => throw _privateConstructorUsedError;
  Map<String, ProductDetails> get products =>
      throw _privateConstructorUsedError;
  List<PurchaseDetails> get purchases => throw _privateConstructorUsedError;
  List<String> get consumables => throw _privateConstructorUsedError;
  bool get isAvailable => throw _privateConstructorUsedError;
  bool get purchasePending => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $IAPStateCopyWith<IAPState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IAPStateCopyWith<$Res> {
  factory $IAPStateCopyWith(IAPState value, $Res Function(IAPState) then) =
      _$IAPStateCopyWithImpl<$Res>;
  $Res call(
      {List<String> notFoundIds,
      Map<String, ProductDetails> products,
      List<PurchaseDetails> purchases,
      List<String> consumables,
      bool isAvailable,
      bool purchasePending});
}

/// @nodoc
class _$IAPStateCopyWithImpl<$Res> implements $IAPStateCopyWith<$Res> {
  _$IAPStateCopyWithImpl(this._value, this._then);

  final IAPState _value;
  // ignore: unused_field
  final $Res Function(IAPState) _then;

  @override
  $Res call({
    Object? notFoundIds = freezed,
    Object? products = freezed,
    Object? purchases = freezed,
    Object? consumables = freezed,
    Object? isAvailable = freezed,
    Object? purchasePending = freezed,
  }) {
    return _then(_value.copyWith(
      notFoundIds: notFoundIds == freezed
          ? _value.notFoundIds
          : notFoundIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      products: products == freezed
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as Map<String, ProductDetails>,
      purchases: purchases == freezed
          ? _value.purchases
          : purchases // ignore: cast_nullable_to_non_nullable
              as List<PurchaseDetails>,
      consumables: consumables == freezed
          ? _value.consumables
          : consumables // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isAvailable: isAvailable == freezed
          ? _value.isAvailable
          : isAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
      purchasePending: purchasePending == freezed
          ? _value.purchasePending
          : purchasePending // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_IAPStateCopyWith<$Res> implements $IAPStateCopyWith<$Res> {
  factory _$$_IAPStateCopyWith(
          _$_IAPState value, $Res Function(_$_IAPState) then) =
      __$$_IAPStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<String> notFoundIds,
      Map<String, ProductDetails> products,
      List<PurchaseDetails> purchases,
      List<String> consumables,
      bool isAvailable,
      bool purchasePending});
}

/// @nodoc
class __$$_IAPStateCopyWithImpl<$Res> extends _$IAPStateCopyWithImpl<$Res>
    implements _$$_IAPStateCopyWith<$Res> {
  __$$_IAPStateCopyWithImpl(
      _$_IAPState _value, $Res Function(_$_IAPState) _then)
      : super(_value, (v) => _then(v as _$_IAPState));

  @override
  _$_IAPState get _value => super._value as _$_IAPState;

  @override
  $Res call({
    Object? notFoundIds = freezed,
    Object? products = freezed,
    Object? purchases = freezed,
    Object? consumables = freezed,
    Object? isAvailable = freezed,
    Object? purchasePending = freezed,
  }) {
    return _then(_$_IAPState(
      notFoundIds: notFoundIds == freezed
          ? _value._notFoundIds
          : notFoundIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      products: products == freezed
          ? _value._products
          : products // ignore: cast_nullable_to_non_nullable
              as Map<String, ProductDetails>,
      purchases: purchases == freezed
          ? _value._purchases
          : purchases // ignore: cast_nullable_to_non_nullable
              as List<PurchaseDetails>,
      consumables: consumables == freezed
          ? _value._consumables
          : consumables // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isAvailable: isAvailable == freezed
          ? _value.isAvailable
          : isAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
      purchasePending: purchasePending == freezed
          ? _value.purchasePending
          : purchasePending // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_IAPState implements _IAPState {
  const _$_IAPState(
      {final List<String> notFoundIds = const [],
      final Map<String, ProductDetails> products =
          const <String, ProductDetails>{},
      final List<PurchaseDetails> purchases = const <PurchaseDetails>[],
      final List<String> consumables = const <String>[],
      this.isAvailable = false,
      this.purchasePending = false})
      : _notFoundIds = notFoundIds,
        _products = products,
        _purchases = purchases,
        _consumables = consumables;

  final List<String> _notFoundIds;
  @override
  @JsonKey()
  List<String> get notFoundIds {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_notFoundIds);
  }

  final Map<String, ProductDetails> _products;
  @override
  @JsonKey()
  Map<String, ProductDetails> get products {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_products);
  }

  final List<PurchaseDetails> _purchases;
  @override
  @JsonKey()
  List<PurchaseDetails> get purchases {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_purchases);
  }

  final List<String> _consumables;
  @override
  @JsonKey()
  List<String> get consumables {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_consumables);
  }

  @override
  @JsonKey()
  final bool isAvailable;
  @override
  @JsonKey()
  final bool purchasePending;

  @override
  String toString() {
    return 'IAPState(notFoundIds: $notFoundIds, products: $products, purchases: $purchases, consumables: $consumables, isAvailable: $isAvailable, purchasePending: $purchasePending)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_IAPState &&
            const DeepCollectionEquality()
                .equals(other._notFoundIds, _notFoundIds) &&
            const DeepCollectionEquality().equals(other._products, _products) &&
            const DeepCollectionEquality()
                .equals(other._purchases, _purchases) &&
            const DeepCollectionEquality()
                .equals(other._consumables, _consumables) &&
            const DeepCollectionEquality()
                .equals(other.isAvailable, isAvailable) &&
            const DeepCollectionEquality()
                .equals(other.purchasePending, purchasePending));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_notFoundIds),
      const DeepCollectionEquality().hash(_products),
      const DeepCollectionEquality().hash(_purchases),
      const DeepCollectionEquality().hash(_consumables),
      const DeepCollectionEquality().hash(isAvailable),
      const DeepCollectionEquality().hash(purchasePending));

  @JsonKey(ignore: true)
  @override
  _$$_IAPStateCopyWith<_$_IAPState> get copyWith =>
      __$$_IAPStateCopyWithImpl<_$_IAPState>(this, _$identity);
}

abstract class _IAPState implements IAPState {
  const factory _IAPState(
      {final List<String> notFoundIds,
      final Map<String, ProductDetails> products,
      final List<PurchaseDetails> purchases,
      final List<String> consumables,
      final bool isAvailable,
      final bool purchasePending}) = _$_IAPState;

  @override
  List<String> get notFoundIds;
  @override
  Map<String, ProductDetails> get products;
  @override
  List<PurchaseDetails> get purchases;
  @override
  List<String> get consumables;
  @override
  bool get isAvailable;
  @override
  bool get purchasePending;
  @override
  @JsonKey(ignore: true)
  _$$_IAPStateCopyWith<_$_IAPState> get copyWith =>
      throw _privateConstructorUsedError;
}
