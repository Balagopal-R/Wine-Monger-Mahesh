import 'package:flutter/material.dart';

import '../utils/constants/image_constants.dart';

class BottomNavigBar extends StatelessWidget {
  const BottomNavigBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      elevation: 20,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      notchMargin: 8,
      shape: const CircularNotchedRectangle(),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            color: Colors.white,
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                    child: SizedBox(
                        child:
                            Image.asset(kbottomNavHome, color: Colors.black)),
                    onTap: () {}),
                InkWell(
                    child: SizedBox(
                        child:
                            Image.asset(kbottomNavIcon, color: Colors.black)),
                    onTap: () {}),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
