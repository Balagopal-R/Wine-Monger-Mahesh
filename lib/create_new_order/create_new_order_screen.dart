import 'package:flutter/material.dart';
import 'package:wine_monger_mahesh/drawer/drawer.dart';
import 'package:wine_monger_mahesh/order_tab_bar/order_tab_bar_screen.dart';

import '../common_widgets/bottom_navig_bar.dart';
import '../common_widgets/floating_button.dart';

class CreateOrderScreen extends StatelessWidget {
  const CreateOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(246, 255, 255, 255),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        shape: const Border(
            bottom: const BorderSide(color: Color(0xffCAE3A8), width: 2)),
        elevation: 2,
        backgroundColor: Colors.white,
        title: const Padding(
          padding: EdgeInsets.only(left: 60),
          child: const Text(
            "Create a new order",
            style: TextStyle(color: Colors.black, fontSize: 16),
          ),
        ),
        actions: [
          const Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: const Icon(
              Icons.notifications,
              color: Colors.black,
            ),
          )
        ],
      ),
      drawer:  DrawerScreen(),
      body: const OrderTabBarClass(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: const FloatingButtonWidget(),
      bottomNavigationBar: const BottomNavigBar(),
    );
  }
}