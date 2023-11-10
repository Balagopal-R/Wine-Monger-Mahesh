import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wine_monger_mahesh/orders/order_controller.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderScreenController>(
      init: OrderScreenController(),
      builder: (controller){
        controller.fetchOrderData();
         return Scaffold(

          body: Center(
            child: Text('Orders is under progress'),
          ),

          

         );

      }
    );
  }
}