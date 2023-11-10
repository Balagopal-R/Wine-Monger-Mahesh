import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'manufactures_controller.dart';

class ManufacturesScreen extends StatelessWidget {
  const ManufacturesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ManufacturesController>(
      init: ManufacturesController(),
      builder: (controller){
        controller.fetchManufacturesData();
         return Scaffold(

          body: Center(
            child: Text('Manufactures work under progress'),
          ),

          

         );

      }
    );
  }
}