
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../wholesale/wholesale_controller.dart';

class OwnerField extends StatelessWidget {
  const OwnerField({Key? key}) : super(key: key);

// @override
// Widget build(BuildContext context) {
//   return GetBuilder<WholeSaleController>(
//     init: WholeSaleController(),
//     builder: (controller) {
//       return Form(
//         key: controller.formKey7,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Text("Owner"),
//             const SizedBox(
//               height: 10,
//             ),
//             Container(
//               child: Obx(() {
//                 return DropdownButtonHideUnderline(
//                   child: DropdownButtonFormField<String>(
//                     isExpanded: true,
//                     validator: (value) {
//                       return controller.ownerNamevalidator(value as String);
//                     },
//                     isDense: true,
//                     autovalidateMode: AutovalidateMode.onUserInteraction,
//                     decoration: InputDecoration(
//                       contentPadding: EdgeInsets.only(left: 10, right: 10),
//                       focusedBorder: OutlineInputBorder(
//                         borderSide: BorderSide(color: Colors.lightBlueAccent),
//                       ),
//                       hintText: "Select Owner",
//                       border: OutlineInputBorder(
//                         borderSide: BorderSide(color: Colors.white),
//                         borderRadius: BorderRadius.circular(5),
//                       ),
//                     ),
//                     items: [], // Add your dropdown items here
//                     onChanged: (value) async {
//                       // Your onChanged logic here
//                     },
//                     value: controller.setUserName.value, // Use .value to access the observable's value
//                   ),
//                 );
//               }),
//             )
//           ],
//         ),
//       );
//     },
//   );
// }






  @override
  Widget build(BuildContext context) {
    return GetBuilder<WholeSaleController>(
        init: WholeSaleController(),
        builder: (controller) {
          return Form(
            key: controller.formKey7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Owner"),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  child: DropdownButtonHideUnderline(
                    child: 




                    //  Obx(() => 
                    DropdownButtonFormField2(
                        isExpanded: true,
                        validator: (value) {
                          return controller
                              .ownerNamevalidator(value as String);
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
                            hintText: "Select Owner",
                            // hintText: controller.setUserName.value.isEmpty? "Select Owner": controller.setUserName.value,
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(5))),

                        // items: controller.users
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

                        items: [],
                        
                        onChanged: (value) async {

                          // controller.setUserName = value!;

                          // controller.setSelected(value as String);
                          // //controller.listRefresh();

                          // await controller.manuFactureApi();
                          // print(controller.warehouseselected.value);
                        },
                         value: controller.setUserName
                         
                            // value.isNotEmpty ? value: null,

                            // controller.warehouseselected.value.isNotEmpty
                            //     ? controller.warehouseselected.value
                            //     : null,
                      ),
                    // ),
                  ),
                )
              ],
            ),
          );
        });
  }
}

// class HouseUser {
//   const HouseUser(this.id, this.name);

//   final String id;
//   final String name;
// }

