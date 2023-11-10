import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../wholesale/wholesale_controller.dart';
import 'adjustment_widget.dart';

class CostTextfield extends StatelessWidget {
  const CostTextfield({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final WholeSaleController controller = Get.find();
    List<AdjUser> users = <AdjUser>[AdjUser("0", "Select Adjustments")];

    for (int i = 0;
        i < controller.AdjustmentListModelEntity.value.data9.length;
        i++) {
      users.add(
        AdjUser(
            controller
                    .AdjustmentListModelEntity.value.data9[i].adjustmentSkuId ??
                " ",
            controller.AdjustmentListModelEntity.value.data9[i]
                    .adjustmentSkuDescription ??
                " "),
      );
    }

    return GetBuilder<WholeSaleController>(
        init: WholeSaleController(),
        builder: (controller) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (int i = 0;
                  i < controller.AdjustmentListModelEntity.value.data9.length;
                  i++)
                if (controller.adjustmentselected.value ==
                    controller.AdjustmentListModelEntity.value.data9[i]
                        .adjustmentSkuId)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Sku"),
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
                            "${controller.AdjustmentListModelEntity.value.data9[i].adjustmentSku}"),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text("Cost"),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),

              Obx(
                () => DropdownButtonHideUnderline(
                  child: DropdownButtonFormField2(
                    isExpanded: true,
                    hint: Text("Select Adjustments"),
                    decoration: InputDecoration(
                      // prefixIcon: Icon(
                      //   Icons.keyboard_arrow_down,
                      //   color: Colors.black,
                      // ),
                      isDense: false,

                      contentPadding: EdgeInsets.only(
                          left: 10, right: 10, top: 0, bottom: 0),
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    items: users
                        .map((item) => DropdownMenuItem<String>(
                              value: item.id,
                              child: Text(
                                item.name,
                                style: const TextStyle(
                                  color: Colors.black,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ))
                        .toList(),
                    onChanged: (value) async {
                      controller.setSelected3(value as String);

                      // await _controller.filterManufacturerApi();
                      print(controller.adjustmentselected.value);
                    },
                    value: controller.adjustmentselected.value.isNotEmpty
                        ? controller.adjustmentselected.value
                        : null,
                  ),
                ),
              )

              ///
            ],
          );
        });
  }
}
