import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wine_monger_mahesh/create_new_order/create_new_order_screen.dart';
import 'package:wine_monger_mahesh/dashboard/dashboard.dart';
import 'package:wine_monger_mahesh/splash/splash_screen.dart';
import 'login/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: CreateOrderScreen(),
    );
  }
}

