import 'package:flutter/material.dart';

import '../common_widgets/bottom_navig_bar.dart';
import '../common_widgets/floating_button.dart';
import '../dashboard_grid/dashboard_grid_screen.dart';
import '../drawer/drawer.dart';
import '../utils/constants/image_constants.dart';

class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF8F8F8),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        shape: const Border(
            bottom: const BorderSide(color: Color(0xffCAE3A8), width: 2)),
        elevation: 2,
        backgroundColor: Colors.white,
        title: Center(
          
          child: Text(
            "Dashboard",
            style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w600),
          ),
        ),
        actions: [
           Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: SizedBox(
              width: 15,
              height: 15,
              child: Image.asset(ktopNavBell)
              )
          )
        ],
      ),
      drawer: DrawerScreen(),
      body: DashBoardGridScreen(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: const FloatingButtonWidget(),
      bottomNavigationBar: const BottomNavigBar(),
    );
  }
}