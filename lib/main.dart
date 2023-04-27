import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/app/presentation/auth/customer_login.dart';
import 'package:shop_app/app/presentation/auth/customer_sign_up.dart';
import 'package:shop_app/app/presentation/auth/supplier_sign_up.dart';
import 'package:shop_app/app/presentation/main_screens/customer_screen.dart';
import 'package:shop_app/app/presentation/main_screens/profile_screen.dart';
import 'package:shop_app/app/presentation/main_screens/supplier_home_screen.dart';
import 'package:shop_app/app/presentation/main_screens/welcome_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
      // home: const ProfileScreen(),
      initialRoute: '/welcome_screen',
      routes: {
        '/welcome_screen': (context) => const WelcomeScreen(),
        '/customer_screen': (context) => const CustomerScreen(),
        '/supplier_home_screen': (context) => const SupplierHomeScreen(),
        '/customer_sign_up': (context) => const CustomerSignUp(),
        '/customer_login': (context) => const CustomerLogin(),
        '/supplier_sign_up': (context) => const SuppliersSignUp(),
      },
    );
  }
}
