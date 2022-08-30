import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:riverpod_iap/iap_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends ConsumerStatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  ConsumerState<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    AsyncValue<IAPState> iapWatch = ref.watch(iapProvider);
    bool isLoading = iapWatch is AsyncLoading<void>;
    bool isError = iapWatch is AsyncError<void>;
    String? error =
        isError ? (iapWatch as AsyncError<void>).error.toString() : null;

    if (isError) {
      return Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
          ),
          body: Center(
            child: Text(
              "Error: $error",
              style: const TextStyle(fontSize: 30),
            ),
          ));
    }
    if (isLoading) {
      return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else {
      ProductDetails product = iapWatch.value!.products['consumable']!;
      return Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
          ),
          body: isLoading
              ? const Center(child: CircularProgressIndicator())
              : Center(
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.green[800],
                      primary: Colors.white,
                    ),
                    onPressed: () {
                      ref.read(iapProvider.notifier).purchase(product, (() {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text("Purchase Delivered"),
                        ));
                      }));
                    },
                    child: Text(
                      product.title,
                    ),
                  ),
                ));
    }
  }
}
