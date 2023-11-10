import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'reservations_controller.dart';

class ReservationScreen extends StatelessWidget {
  const ReservationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ReservationController>(
      init: ReservationController(),
      builder: (controller){
        controller.fetchReservstionData();
         return Scaffold(

          body: Center(
            child: Text('Reservations work under progress'),
          ),

          

         );

      }
    );
  }
}