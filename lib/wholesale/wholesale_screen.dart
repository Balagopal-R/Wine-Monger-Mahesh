import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../common_widgets/adjustment/adjustment_widget.dart';
import '../common_widgets/confirm_product_widgets.dart';
import '../common_widgets/customer_text_field.dart';
import '../common_widgets/manufacture/manufacture_widgets.dart';
import '../common_widgets/ordered_product_widgets.dart';
import '../common_widgets/owner/owner_field.dart';
import '../common_widgets/product/product_field_widget.dart';
import '../common_widgets/special_instructions_field.dart';
import '../common_widgets/warehouse/warehouse_widget.dart';
import 'wholesale.dart';

class WholeSaleScreen extends StatelessWidget {
  const WholeSaleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WholeSaleController>(
        init: WholeSaleController(),
        builder: (controller) {
          controller.wholesaleCustomerSelection();
          controller.setUser();

          return SingleChildScrollView(
            child: Center(
              child: Container(
                margin: const EdgeInsets.only(bottom: 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    const SelectCustomer(),
                    const SizedBox(
                      height: 15,
                    ),
                    const OwnerField(),
                    const SizedBox(
                      height: 20,
                    ),
                    const SpecialInstructionsField(),
                    const SizedBox(
                      height: 20,
                    ),
                    const WareHouseField(),
                    const SizedBox(
                      height: 20,
                    ),
                    ManuFactureField(),
                    const SizedBox(
                      height: 30,
                    ),
                    const ProductField(),
                    const SizedBox(
                      height: 30,
                    ),
                    selectProductButton(
                      context,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    controller.selectButtonToAddToOrders.value == true
                        ? const ConfirmProductWidgets()
                        : Container(),
                    controller.addToOrders.value == true
                        ? const OrderedProductWidget()
                        : Container(),
                    const AdjustmentWidget(),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}

Widget selectProductButton(BuildContext context) {
  WholeSaleController controller = Get.find();

  return Container(
      height: 47,
      width: 950,
      decoration: BoxDecoration(
        color: Color(0xffCAE3A8),
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 5.0,
          ),
        ],
      ),
      child: GestureDetector(
          onTap: () async {
            controller.checkProductButton();
            await controller.productButtonApi();
            if (controller.productButtonModelEntity.value.id != null) {
              controller.selectButtonToAddToOrders.value = true;
            }
            // controller.fieldRefresh();
          },
          child: const Center(
            child: Text(
              "Select product",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          )));
}
