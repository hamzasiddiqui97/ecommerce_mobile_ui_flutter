import 'package:flutter/material.dart';
import 'package:minimal_ecom_app/models/shop.dart';
import 'package:minimal_ecom_app/pages/cart_page.dart';
import 'package:minimal_ecom_app/pages/home_page.dart';
import 'package:minimal_ecom_app/pages/shop_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
      ChangeNotifierProvider(create: (context) => Shop(),
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: IntroPage(),
      routes: {
        '/intro_page':(context) => const IntroPage(),
        '/shop_page':(context) => const ShopPage(),
        '/cart_page':(context) => const CartPage(),

      },
    );
  }
}
