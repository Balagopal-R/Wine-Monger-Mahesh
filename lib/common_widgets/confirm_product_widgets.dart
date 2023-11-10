import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../wholesale/wholesale_controller.dart';

class ConfirmProductWidgets extends StatelessWidget {
  const ConfirmProductWidgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WholeSaleController>(
      init: WholeSaleController(),
      builder: (controller) {
        return Container(
          child: Form(
            key: controller.formKey5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Sku"),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.grey[200],
                          border: Border.all(color: Colors.black)),
                      child: Text(
                          "${controller.productButtonModelEntity.value.id}"),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Product"),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.grey[200],
                          border: Border.all(color: Colors.black)),
                      child: Text(
                          "${controller.productButtonModelEntity.value.name}"),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("cost"),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.grey[200],
                          border: Border.all(color: Colors.black)),
                      child: controller.productButtonModelEntity.value
                                  .wholesalePrice !=
                              null
                          ? Text(
                              "\$ ${double.parse(controller.productButtonModelEntity.value.wholesalePrice!).toStringAsFixed(2).toString()}")
                          : Text(""),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Quantity"),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: controller.quantityController.value,
                      validator: (value) {
                        if (controller.quantityController.value.text.isEmpty) {
                          return "Enter a number";
                        } else {
                          if (int.parse(
                                  controller.quantityController.value.text) >
                              int.parse(controller
                                  .productButtonModelEntity.value.onHand!)) {
                            return 'Quantity available : ${controller.productButtonModelEntity.value.onHand!} only';
                          }
                        }
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        contentPadding: EdgeInsets.all(13),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0xffdfdfdf),
                          ),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                InkWell(
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: Colors.green[200],
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.4),
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset: Offset(1, 1), // changes position of shadow
                        ),
                      ],
                    ),
                    child: const Text("Add to Orders",
                        style: TextStyle(color: Colors.black)),
                  ),
                  onTap: () async {
                    if (controller.productButtonModelEntity.value.id != null) {
                      await controller.addToOrdersValidations();
                    }
                    
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
