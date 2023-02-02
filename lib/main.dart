import 'package:flutter/material.dart';
import 'package:shop_app/app/presentation/main_screens/customer_screen.dart';

void main() {
  runApp(
    const ShopApp(),
  );
}

class ShopApp extends StatelessWidget {
  const ShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CustomerScreen(),
    );
  }
}
