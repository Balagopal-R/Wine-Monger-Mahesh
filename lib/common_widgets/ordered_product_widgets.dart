import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../wholesale/wholesale_controller.dart';

class OrderedProductWidget extends StatelessWidget {
  const OrderedProductWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WholeSaleController>(
        init: WholeSaleController(),
        builder: (controller) {
          return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Container(
                          padding: EdgeInsets.all(3),
                          child: Text(
                            "Product",
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                          padding: EdgeInsets.all(3),
                          child: Text(
                            "Cost",
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                          padding: EdgeInsets.all(3),
                          child: Text(
                            "Quantity",
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                          padding: EdgeInsets.all(3),
                          child: Text(
                            "Amount",
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          padding: EdgeInsets.all(3),
                          child: Text(
                            "",
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                for (int j = 0;
                    j < controller.bulkAddAdjustmentslist.value.value.length;
                    j++)
                  if (controller.bulkAddAdjustmentslist.value.value[j].sku !=
                          "Discount" &&
                      controller
                              .bulkAddAdjustmentslist.value.value[j].sku !=
                          "Product Samples" &&
                      controller.bulkAddAdjustmentslist.value.value[j].sku !=
                          "Donation" &&
                      controller
                              .bulkAddAdjustmentslist.value.value[j].sku !=
                          "Shipping surcharge" &&
                      controller.bulkAddAdjustmentslist.value.value[j].sku !=
                          "Breakage" &&
                      controller.bulkAddAdjustmentslist.value.value[j].sku !=
                          "Spoiled products" &&
                      controller.bulkAddAdjustmentslist.value.value[j].sku !=
                          "Other" &&
                      controller.bulkAddAdjustmentslist.value.value[j].sku !=
                          "Note" &&
                      controller.bulkAddAdjustmentslist.value.value[j].sku !=
                          "Sales Tax Payable" &&
                      controller.bulkAddAdjustmentslist.value.value[j].sku !=
                          "Sales Tax California - 7.25%" &&
                      controller.bulkAddAdjustmentslist.value.value[j].sku !=
                          "Product Samples" &&
                      controller.bulkAddAdjustmentslist.value.value[j].sku !=
                          "Sales Tax San Francisco - 8.5%" &&
                      controller.bulkAddAdjustmentslist.value.value[j].sku !=
                          "Sales Tax Marin - 8.25%" &&
                      controller.bulkAddAdjustmentslist.value.value[j].sku !=
                          "Sales Tax Napa - 7.75%" &&
                      controller.bulkAddAdjustmentslist.value.value[j].sku !=
                          "PO Number")
                    Container(
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 2,
                              child: Container(
                                padding: EdgeInsets.all(3),
                                child: Text(
                                  "${controller.bulkAddAdjustmentslist.value.value[j].lineDsc}",
                                  // "${controller.productButtonModelEntity.value.name}"
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Container(
                                padding: EdgeInsets.all(3),
                                child: controller.bulkAddAdjustmentslist.value
                                            .value[j].value !=
                                        null
                                    ? Text(
                                        "\$${double.parse(controller.bulkAddAdjustmentslist.value.value[j].value!)}")
                                    : Text(""),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Container(
                                alignment: Alignment.topLeft,
                                padding: EdgeInsets.only(
                                    left: 20, right: 3, top: 3, bottom: 3),
                                child: Text(
                                  "${controller.bulkAddAdjustmentslist.value.value[j].qty}",
                                  textAlign: TextAlign.start,
                                ),
                              ),
                            ),
                            (controller.bulkAddAdjustmentslist.value.value[j]
                                        .total !=
                                    null)
                                ? Expanded(
                                    flex: 2,
                                    child: Container(
                                      padding: EdgeInsets.all(3),
                                      child: Text(
                                        "\$${controller.bulkAddAdjustmentslist.value.value[j].total!.toString()}",
                                      ),
                                    ),
                                  )
                                : Container(),
                            Expanded(
                              flex: 1,
                              child: InkWell(
                                child: Icon(Icons.delete),
                                onTap: () {
                                  // selectButtonToAddToOrders = false;

                                  // controller.removeToOrders();

                                  controller.removeToOrdersApi(
                                      id: controller.bulkAddAdjustmentslist
                                          .value.value[j].id,
                                      total: controller.bulkAddAdjustmentslist
                                          .value.value[j].total,
                                      totalPreOrderlineId: controller
                                          .bulkAddAdjustmentslist
                                          .value
                                          .value[j]
                                          .totalPreOrderlineId);
                                },
                              ),
                            ),
                          ],
                        ))
                  else
                    Obx(
                      () => Container(
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 2,
                                child: Container(
                                  padding: EdgeInsets.all(3),
                                  child: Text(
                                      "${controller.bulkAddAdjustmentslist.value.value[j].sku}"),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Container(
                                  padding: EdgeInsets.all(3),
                                  child: controller.bulkAddAdjustmentslist.value
                                              .value[j].value !=
                                          null
                                      ? Text(
                                          " ${stringModifier((controller.bulkAddAdjustmentslist.value.value[j].value!))}")
                                      : Text(""),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Container(
                                  alignment: Alignment.topLeft,
                                  padding: EdgeInsets.only(
                                      left: 20, right: 3, top: 3, bottom: 3),
                                  child: Text(
                                    "${controller.bulkAddAdjustmentslist.value.value[j].qty}",
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                              ),
                              (controller.bulkAddAdjustmentslist.value.value[j]
                                          .total !=
                                      null)
                                  ? Expanded(
                                      flex: 2,
                                      child: Container(
                                        padding: EdgeInsets.all(3),
                                        child: Text(
                                          "${stringModifier(controller.bulkAddAdjustmentslist.value.value[j].total.toString())}",
                                        ),
                                      ),
                                    )
                                  : Container(),
                              Expanded(
                                flex: 1,
                                child: InkWell(
                                  child: Icon(Icons.delete),
                                  onTap: () async {
                                    // controller.removeToAdjustment();
                                    controller.removeToOrders();
                                    // selectButtonToAddToOrders = false;
                                    print(controller.bulkAddAdjustmentslist
                                        .value.value[j].id.runtimeType);
                                    print(controller.bulkAddAdjustmentslist
                                        .value.value[j].total.runtimeType);
                                    print(controller
                                        .bulkAddAdjustmentslist
                                        .value
                                        .value[j]
                                        .totalPreOrderlineId
                                        .runtimeType);
                                    await controller.removeAdjustmentAPi(
                                        id: controller.bulkAddAdjustmentslist
                                            .value.value[j].id
                                            .toString(),
                                        total: controller.bulkAddAdjustmentslist
                                            .value.value[j].total,
                                        totalPreorderlineid: controller
                                            .bulkAddAdjustmentslist
                                            .value
                                            .value[j]
                                            .totalPreOrderlineId
                                            .toString());
                                  },
                                ),
                              ),
                            ],
                          )),
                    ),
              ]);
        });
  }
}

String stringModifier(value) {
  var string1 = value;
  if (string1.contains('-')) {
    var string2 = string1.replaceAll(RegExp('-'), '');
    return "-\$${string2}";
  } else
    return "\$${string1}";
}







// class OrderedProductWidget extends StatelessWidget {
//   const OrderedProductWidget({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<WholeSaleController>(
//         init: WholeSaleController(),
//         builder: (controller) {
//           return controller.AddToOrderButtonModelEntity.value.data7.lineDsc ==
//                   null
//               ? Container()
//               : SingleChildScrollView(
//                   scrollDirection: Axis.horizontal,
//                   child: DataTable(
//                     columns: const <DataColumn>[
//                       DataColumn(
//                         label: Text(
//                           'Product',
//                           style: TextStyle(fontStyle: FontStyle.italic),
//                         ),
//                       ),
//                       DataColumn(
//                         label: Text(
//                           'Cost',
//                           style: TextStyle(fontStyle: FontStyle.italic),
//                         ),
//                       ),
//                       DataColumn(
//                         label: Text(
//                           'Quantity',
//                           style: TextStyle(fontStyle: FontStyle.italic),
//                         ),
//                       ),
//                       DataColumn(
//                         label: Text(
//                           'Amount',
//                           style: TextStyle(fontStyle: FontStyle.italic),
//                         ),
//                       ),
//                       DataColumn(
//                         label: Text(
//                           '',
//                           style: TextStyle(fontStyle: FontStyle.italic),
//                         ),
//                       ),
//                     ],
//                     rows: <DataRow>[
//                       //  for (int i = 0;
//                       //     i <
//                       //         controller.AddToOrderButtonModelEntity.value.data7.

//                       //      i++)
//                       //     //  /{
//                       //   addresses1.add(ProductUser(
//                       //       controller.FilterProductModelEntity.value.data2
//                       //               .data3[i].id ??
//                       //           "",
//                       //       controller.FilterProductModelEntity.value.data2
//                       //               .data3[i].name ??
//                       //           ""));
//                       // }
//                       // return addresses1;

//                       DataRow(
//                         //selected: true,
//                         cells: <DataCell>[
//                           DataCell(Text(
//                               '${controller.AddToOrderButtonModelEntity.value.data7.lineDsc}')),
//                           DataCell(controller.AddToOrderButtonModelEntity.value
//                                       .data7.value !=
//                                   null
//                               ? Text(
//                                   ' "\$ ${double.parse(controller.AddToOrderButtonModelEntity.value.data7.value!)}"')
//                               : Text('')),
//                           DataCell(Text(
//                               "${controller.AddToOrderButtonModelEntity.value.data7.qty}",
//                               textAlign: TextAlign.start)),
//                           DataCell(Text(
//                               '"\$ ${controller.AddToOrderButtonModelEntity.value.data7.total}"')),
//                           DataCell(IconButton(
//                               onPressed: () {
//                                 debugPrint("1st cell");
//                                 controller.removeToOrders();
//                               },
//                               icon: Icon(Icons.delete)))
//                         ],
//                       ),
//                     ],
//                   ),
//                 );
//         });
//   }
// }
