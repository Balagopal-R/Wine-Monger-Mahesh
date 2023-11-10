import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../wholesale/wholesale_controller.dart';

class WareHouseField extends StatelessWidget {
  const WareHouseField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WholeSaleController>(
        init: WholeSaleController(),
        builder: (controller) {
          return Form(
            key: controller.formKey2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("WareHouse"),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  child: DropdownButtonHideUnderline(
                    child: Obx(
                      () => DropdownButtonFormField2(
                        isExpanded: true,
                        validator: (value) {
                          return controller
                              .warehouseNamevalidator(value as String);
                        },
                        isDense: true,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.only(left: 10, right: 10),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.lightBlueAccent),
                            ),
                            hintText: "Select warehouse",
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(5))),
                        // items: controller.warehouseNames
                        //     .map(
                        //       (item) => DropdownMenuItem<String>(
                        //         value: item.id,
                        //         child: Text(
                        //           item.name,
                        //           overflow: TextOverflow.ellipsis,
                        //         ),
                        //       ),
                        //     )
                        //     .toList(),

                        items: controller.users
                            .map(
                              (item) => DropdownMenuItem<String>(
                                value: item.id,
                                child: Text(
                                  item.name,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            )
                            .toList(),
                            
                        // icon: const Icon(Icons.keyboard_arrow_down),
                        // iconSize: 20,
                        // dropdownMaxHeight: 250,
                        // itemHeight: 40,
                        // itemPadding: const EdgeInsets.only(left: 14, right: 14),
                        // buttonHeight: 52,
                        // dropdownElevation: 4,
                        // dropdownPadding: null,
                        // dropdownDecoration: BoxDecoration(
                        //     borderRadius: BorderRadius.circular(2),
                        //     border: Border.all(
                        //         color: Colors.transparent, width: 0)),
                        // scrollbarAlwaysShow: true,
                        // scrollbarRadius: const Radius.circular(2),
                        // scrollbarThickness: 4,
                        onChanged: (value) async {
                          controller.setSelected(value as String);
                          //controller.listRefresh();

                          await controller.manuFactureApi();
                          print(controller.warehouseselected.value);
                        },
                        value:
                            // value.isNotEmpty ? value: null,

                            controller.warehouseselected.value.isNotEmpty
                                ? controller.warehouseselected.value
                                : null,
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        });
  }
}

class HouseUser {
  const HouseUser(this.id, this.name);

  final String id;
  final String name;
}
