import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wine_monger_mahesh/common_widgets/adjustment/quantity_text_field_widget.dart';

import '../../wholesale/wholesale.dart';
import 'cost_field_widget.dart';

class AdjustmentWidget extends StatelessWidget {
  const AdjustmentWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WholeSaleController>(
        init: WholeSaleController(),
        builder: (controller) {
          return Form(
            key: controller.formKey6,
            child: const Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                CostTextfield(),
                SizedBox(
                  height: 10,
                ),
                QauntityTextField(),
                SizedBox(
                  height: 10,
                ),
                AddButtonWidget(),
                SizedBox(
                  height: 10,
                )
              ],
            ),
          );
        });
  }
}

class AddButtonWidget extends StatelessWidget {
  const AddButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final WholeSaleController controller = Get.find();

    Map<String, String> map1 = {
      '1': '-',
      '2': '-',
      '3': '-',
      '4': '-',
      '5': '-',
      '6': '-',
      '7': '+',
      '8': '+',
      '9': '+',
      '10': '+',
      '12': '+',
      '13': '+',
      '14': '+',
      '15': '+',
    };
    return Obx(() => Column(
          children: [
            for (int i = 0;
                i < controller.AdjustmentListModelEntity.value.data9.length;
                i++)
              if (controller.adjustmentselected.value ==
                  controller
                      .AdjustmentListModelEntity.value.data9[i].adjustmentSkuId)
                InkWell(
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: Colors.green[200],
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.4),
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset:
                              const Offset(1, 1), // changes position of shadow
                        ),
                      ],
                    ),
                    child: const Text("Add",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, color: Colors.black)),
                  ),
                  onTap: () {
                    for (final mapEntry in map1.entries) {
                      final key = mapEntry.key;
                      final value = mapEntry.value;
                      //print('Key: $key, Value: $value');
                      if (controller.adjustmentselected.value == key) {
                        print("hello ${key}");
                        print("hello ${value}");
                        controller.addAdjustmentOrder(value);
                      }
                    }

                    controller.adjustmentView();
                  },
                ),
          ],
        ));
  }
}

class AdjUser {
  const AdjUser(this.id, this.name);

  final String id;
  final String name;
}
