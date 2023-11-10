import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'tastings.dart';

class TastingsScreen extends StatelessWidget {
  const TastingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TastingsController>(
      init: TastingsController(),
      builder: (controller){
        controller.fetchTastingsData();
         return Scaffold(

          body: Center(
            child: Text('Tastings work under progress'),
          ),

          

         );

      }
    );
  }
}