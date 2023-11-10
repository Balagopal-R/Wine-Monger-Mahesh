import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';

import '../../wholesale/wholesale_controller.dart';

class ProductField extends StatelessWidget {
  const ProductField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isValid1;
    return GetBuilder<WholeSaleController>(
      init: WholeSaleController(),
      builder: (controller) {
        return Form(
          key: controller.formKey4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Product',
              ),
              const SizedBox(
                height: 10,
              ),
              Obx(
                () => TypeAheadFormField(
                  suggestionsBoxVerticalOffset: 0.0,
                  minCharsForSuggestions: 1,
                  textFieldConfiguration: TextFieldConfiguration(
                      controller: controller.productController.value,
                      autofocus: true,
                      // style: DefaultTextStyle.of(context)
                      //     .style
                      //     .copyWith(fontStyle: FontStyle.italic),
                      decoration: const InputDecoration(
                          contentPadding: EdgeInsets.only(
                              top: 2, right: 10, left: 10, bottom: 2),
                          hintText: "Select product",
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.lightBlueAccent)),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                          focusColor: Colors.white)),
                  suggestionsCallback: (value) async {
                    List<ProductUser> addresses1 = <ProductUser>[];
                    for (int i = 0;
                        i <
                            controller.FilterProductModelEntity.value.data2
                                .data3.length;
                        i++) {
                      addresses1.add(ProductUser(
                          controller.FilterProductModelEntity.value.data2
                                  .data3[i].id ??
                              "",
                          controller.FilterProductModelEntity.value.data2
                                  .data3[i].name ??
                              ""));
                    }
                    return addresses1;
                  },
                  itemBuilder: (context, ProductUser addresses1) {
                    return Row(
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsets.all(14),
                            child: Text(
                              '${addresses1.name}',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        )
                      ],
                    );
                  },
                  onSuggestionSelected: (ProductUser addresses1) {
                    controller.productController.value.text =
                        addresses1.name as String;
                    controller.productController1.value.text =
                        addresses1.id as String;

                    print(controller.productController.value.text);

                    print(controller.productController1.value.text);
                  },
                  validator: (value) {
                    return controller.productNameValidator(value!);
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

class ProductUser {
  final String id;
  final String name;

  ProductUser(this.id, this.name);
}
