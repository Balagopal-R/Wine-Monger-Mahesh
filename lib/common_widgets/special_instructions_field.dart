import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wine_monger_mahesh/wholesale/wholesale.dart';

class SpecialInstructionsField extends StatelessWidget {
  const SpecialInstructionsField({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WholeSaleController>(
      init: WholeSaleController(),
      builder: (controller) {
        return Form(
          key: controller.formKey8,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Special Instruction'),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: controller.specialInstructionsController.value ,
                  decoration: const InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      hintText: "Special instrucion",
                      contentPadding:
                          EdgeInsets.only(top: 2, right: 10, left: 10, bottom: 2),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.lightBlueAccent)),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      focusColor: Colors.white))
            ],
          ),
        );
      }
    );
  }
}
