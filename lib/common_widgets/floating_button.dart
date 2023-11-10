import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../create_new_order/create_new_order_screen.dart';

class FloatingButtonWidget extends StatelessWidget {
  const FloatingButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: const Color(0xff717F5E),
      child: const Icon(
        Icons.add,
        size: 49,
      ),
      onPressed: () {
        Get.to(CreateOrderScreen());
      },
    );
  }
}