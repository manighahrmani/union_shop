import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'view_models/product_view_model.dart';
import 'views/home_view.dart';
import 'views/product_page_view.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductViewModel()..loadProducts()),
      ],
      child: const UnionShopApp(),
    ),
  );
}

class UnionShopApp extends StatelessWidget {
  const UnionShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Union Shop',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF4d2963))),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeView(),
        '/product': (context) => const ProductPageView(),
      },
    );
  }
}