import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:wine_monger_mahesh/models/ware_house_model.dart';
import '../common_widgets/manufacture/manufacture_widgets.dart';
import '../common_widgets/warehouse/warehouse_widget.dart';
import '../models/add_adjustment_order_model.dart';
import '../models/addto_order_model.dart';
import '../models/adjustment_list_model.dart';
import '../models/customer_model.dart';
import '../models/delete_product_model.dart';
import '../models/manufacture_model.dart';
import '../models/product_button_model.dart';
import '../models/product_model.dart';
import '../models/remove_adjustment_model.dart';
import '../models/setUser_model.dart';

class User {
  const User(this.id, this.name);

  final String id;
  final String name;
}

class WholeSaleController extends GetxController {
  final GlobalKey<FormState> formKey1 = GlobalKey<FormState>();
  final GlobalKey<FormState> formKey2 = GlobalKey<FormState>();
  final GlobalKey<FormState> formKey3 = GlobalKey<FormState>();
  final GlobalKey<FormState> formKey4 = GlobalKey<FormState>();
  final GlobalKey<FormState> formKey5 = GlobalKey<FormState>();
  final GlobalKey<FormState> formKey6 = GlobalKey<FormState>();
  final GlobalKey<FormState> formKey7 = GlobalKey<FormState>();
  final GlobalKey<FormState> formKey8 = GlobalKey<FormState>();

  var customerList = List<CustomerModel>.empty(growable: true);
  List<User> companyNames = [];
  List<String> customerIds = [];
  List<WarehouseModel> warehouseNames = [];

  var setUserName = "".obs;

  var warehouseselected = "0".obs;
  var users = <HouseUser>[HouseUser("0", "select warehouse")].obs;

  var ownerselected = "0".obs;
  var adjustmentselected = "0".obs;
  var manufactureselected = '0'.obs;
  var users2 = <User2>[User2("0", "select manufacture")].obs;
  var RemoveAdjustmentModelEntity = RemoveAdjustment().obs;
  final bulkAddAdjustmentslist = Rx<List<dynamic>>([]).obs;
  var AddToOrderButtonModelEntity = AddToOrderButtonModel(data7: Data7()).obs;

  var customerController1 = TextEditingController().obs;
  var customerController2 = TextEditingController().obs;
  var productController = TextEditingController().obs;
  var productController1 = TextEditingController().obs;
  var quantityController = TextEditingController().obs;
  var quantityController1 = TextEditingController().obs;
  var specialInstructionsController = TextEditingController().obs;

  final selectButtonToAddToOrders = false.obs;

  final addToOrders = false.obs;
  final addToOrders1 = false.obs;
  final addadjustments = true.obs;

  var manufactureModelEntity =
      ManuFactureModel(dataone: List<DatumOne>.empty(growable: true)).obs;
  var WarehouseModelEntity =
      WarehouseModel(data: List<WareHouseDatum>.empty(growable: true)).obs;
  var AdjustmentListModelEntity =
      AdjustmentListModel(data9: List<Data9>.empty(growable: true)).obs;
  var productButtonModelEntity =
      SelectButtonModel(productSpecs: ProductSpecs()).obs;
  var AddAdjustmentsToOrdersModelEntity =
      AddAdjustmentToOrderModel(data10: Data10()).obs;

  set text(String text) {}

  void checkProductButton() {
    // customerNameValidator("a");
    // warehouseNamevalidator("b");
    // manufacturerNameValidator("c");
    // productNameValidator("d");
    final isValid1 = formKey1.currentState!.validate();
    final isValid2 = formKey2.currentState!.validate();
    final isValid3 = formKey3.currentState!.validate();
    final isValid4 = formKey4.currentState!.validate();
    Get.focusScope!.unfocus();

    if (isValid1 && isValid2 && isValid3 && isValid4) {
      formKey1.currentState!.save();
      formKey2.currentState!.save();
      formKey3.currentState!.save();
      formKey4.currentState!.save();
    }
  }

  @override
  void onInit() async {
    super.onInit();

    await WareHouseApi();
    await adjustmentlistApi();
    // await fetchWarehouseNames();
  }

  @override
  void onClose() {
    customerController1.value.dispose();
    customerController2.value.dispose();
    warehouseselected.value = '0';
    manufactureselected.value = '0';
    productController.value.dispose();
    productController1.value.dispose();
    super.onClose();
    // update();
  }

  @override
  void dispose() {
    super.dispose();
  }

  String? warehouseNamevalidator(String value) {
    if (value == null || warehouseselected.value == '0') {
      return 'selected warehouse';
    }
  }

  String? ownerNamevalidator(String value) {
    if (value == null || ownerselected.value == '0') {
      return 'select owner';
    }
  }

  String? customerNameValidator(String value) {
    if (customerController1.value.text.isEmpty ||
        customerController1.value.text.length < 1) {
      debugPrint("verified");
      return 'Select Customer';
    } else {}
    return null;
  }

  String? productNameValidator(String value) {
    if (productController1.value.text.isEmpty ||
        productController1.value.text.length < 1) {
      return 'select product';
    }
    return null;
  }

  void setSelected2(String value) {
    manufactureselected.value = value;
  }

  String? manufacturerNameValidator(String value) {
    if (value == null || manufactureselected.value == '0') {
      return 'Select Manufacturer';
    }
    return null;
  }

  Future<void> wholesaleCustomerSelection() async {
    const String apiUrl =
        'http://winemonger.nintriva.com//api/search/customers';
    const String apiKey = 'owxdR7uk3HWimq9MO6CleX8Kt';
    final Map<String, dynamic> requestBody = {"wholesale": 1};

    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {'Apikey': apiKey},
      body: jsonEncode(requestBody),
    );

    if (response.statusCode == 200) {
      // print('Response: ${response.body}');
      var jsonString = response.body;
      // print(jsonString);

      CustomerModel customer = customerModelFromJson(jsonString);

      for (var data in customer.data) {
        companyNames.add(User(data.customerId, data.companyName));
        // customerIds.add(data.customerId);
      }

      // print('Company Names: $companyNames');
      // print('Customer IDs: $customerIds');

      //    for (var item in jsonString["data"]) {
      //   String companyName = item["company_name"];
      //   // if (companyName.isNotEmpty) {
      //     companyNames.add(companyName);
      //   // }
      // }
      // print(companyNames);
    } else {
      print('Request failed with status: ${response.statusCode}');
      print('Response body: ${response.body}');
    }
  }

  Future<void> setUser() async {
    final url = 'http://winemonger.nintriva.com//apiV1/customers/setUser';
    final headers = {
      'Apikey': 'owxdR7uk3HWimq9MO6CleX8Kt',
    };
    // final body = customerID.value ;

    final response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: customerController2.value.text,
    );

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      final setUserModel = SetUserModel.fromJson(jsonResponse);

      if (setUserModel.status == 1) {
        setUserName.value = setUserModel.data.displayname;
        print('Display Name: $setUserName');
      } else {
        print('Request succeeded, but status was not 1.');
      }
    } else {
      print('Request failed with status: ${response.statusCode}');
      print('Response data: ${response.body}');
    }
  }

  void setSelected(String value) {
    warehouseselected.value = value;
    print("++++++$value");
  }

  Future<void> WareHouseApi() async {
    var baseUrl = 'winemonger.nintriva.com';
    var endpoint = 'api/list/warehouses';
    var headers = {'APIKEY': 'owxdR7uk3HWimq9MO6CleX8Kt'};
    var url = Uri.http(baseUrl, endpoint);

    // Await the http get response, then decode the json-formatted response.
    try {
      var response = await http.get(
        url,
        headers: headers,
      );
      // print(response);
      if (response.statusCode == 200) {
        WarehouseModelEntity.value =
            WarehouseModel.fromJson(jsonDecode(response.body));
        for (int i = 0; i < WarehouseModelEntity.value.data.length; i++) {
          users.add(HouseUser(
              WarehouseModelEntity.value.data[i].warehouseId ?? "",
              WarehouseModelEntity.value.data[i].warehouseName ?? ""));
        }

        // print('success');
      } else {
        // print('failed');
        throw Exception('failed to load');
      }
      // print(WarehouseModelEntity.value.toJson());
    } catch (e) {
      //print(() => e.toString());
    }
    update();
  }

  Future<void> adjustmentlistApi() async {
    var baseUrl = 'winemonger.nintriva.com';
    var endpoint = 'api/list/adjustments';
    var headers = {"APIKEY": "owxdR7uk3HWimq9MO6CleX8Kt"};
    try {
      var url = Uri.http(baseUrl, endpoint);

      var response = await http.get(
        url,
        headers: headers,
      );
      print(response);
      if (response.statusCode == 200) {
        AdjustmentListModelEntity.value =
            AdjustmentListModel.fromJson(jsonDecode(response.body));
        print("Adjustment active");
        print(AdjustmentListModelEntity.value.toJson());
      } else {
        print("adjustmet faild");
        throw Exception('failed to select adjstmnt');
      }
    } catch (e) {
      print(e.toString());
    }
    update();
  }

  Future<void> manuFactureApi() async {
    var baseUrl = 'winemonger.nintriva.com';
    var endpoint = 'api/search/manufacturers';
    var headers = {'APIKEY': "owxdR7uk3HWimq9MO6CleX8Kt"};
    var url = Uri.http(
      baseUrl,
      endpoint,
    );
    try {
      print('warehouse_id${warehouseselected.value}');
      var response = await http.post(url,
          headers: headers,
          body: jsonEncode({'warehouse_id': '${warehouseselected.value}'}));
      print("resp:$response");
      if (response.statusCode == 200) {
        print("bbbbbbbbbbbbbbbbbbbbbbbbbb");
        users2.clear();
        print('gghghghg${manufactureModelEntity.value.dataone![0].manName[0]}');
        users2.value = <User2>[User2("0", "select manufacture")];
        manufactureModelEntity.value =
            ManuFactureModel.fromJson(jsonDecode(response.body));
        for (int i = 0; i < manufactureModelEntity.value.dataone!.length; i++) {
          users2.add(User2(
            manufactureModelEntity.value.dataone![i].manId[i],
            manufactureModelEntity.value.dataone![i].manName[i],
          ));
        }

        // print("active");
        // print(manufactureModelEntity.value.toJson());
      } else {
        print(" not active");
        throw Exception('failed to load');
      }
    } catch (e) {
      print(() => e.toString());
    }
    update();
  }

  var FilterProductModelEntity = FilterProductModel(
      data2: NewData(
    data3: List<Datumproduct>.empty(growable: true),
  )).obs;

  Future<void> filterProductApi() async {
    var baseUrl = 'winemonger.nintriva.com';
    var endpoint = 'apiV1/orders/filterProduct';
    var headers = {'APIKEY': "owxdR7uk3HWimq9MO6CleX8Kt"};
    var url = Uri.http(
      baseUrl,
      endpoint,
    );
    try {
      var response = await http.post(url,
          headers: headers,
          body: jsonEncode({
            'filters': {
              'wholesale': 1,
              'warehouse_id': '${warehouseselected.value}',
              'manufacturer': '${manufactureselected.value}'
            }
          }));

      if (response.statusCode == 200) {
        FilterProductModelEntity.value =
            FilterProductModel.fromJson(jsonDecode(response.body));
        print("data found");
        print(response.toString());
        print(FilterProductModelEntity.value.toJson());
      } else {
        print(" no data found");
        throw Exception('failed to load');
      }
    } catch (e) {
      print(() => e.toString());
    }
    update();
  }

  Future<void> productButtonApi() async {
    var baseUrl = 'winemonger.nintriva.com';
    var endpoint = 'api/view/products';
    var headers = {
      'APIKEY': "owxdR7uk3HWimq9MO6CleX8Kt",
      'Cookie': "PHPSESSID=hd7jm84rtht8kr30giikfjc8sc"
    };

    var url = Uri.http(
      baseUrl,
      endpoint,
    );
    try {
      var response = await http.post(
        url,
        headers: headers,
        body: jsonEncode({"id": '${productController1.value.text}'}),
      );
      print(response);
      if (response.statusCode == 200) {
        productButtonModelEntity.value =
            SelectButtonModel.fromJson(jsonDecode(response.body));
        print("button active");
        print(productButtonModelEntity.value.toJson());
      } else {
        print("button inactive");
        throw Exception("failed to select button");
      }
    } catch (e) {
      print(e.toString());
    }
    update();
  }

  Future<void> addToOrdersValidations() async {
    final isValid5 = formKey5.currentState!.validate();
    Get.focusScope!.unfocus();

    if (isValid5) {
      formKey5.currentState!.save();
      await addToOrdersApi(
        product_id: productButtonModelEntity.value.id,
        qty: quantityController.value.text,
        line_sku: productButtonModelEntity.value.sku,
        line_dsc: productButtonModelEntity.value.name,
        line_value: productButtonModelEntity.value.wholesalePrice,
      );

      addToOrders.value = true;
      selectButtonToAddToOrders.value = false;
      await bulklist1Api();
      await totalcalculation();

      // print(customerController1.value.text);
    }
  }

  Future<void> bulklist1Api() async {
    bulkAddAdjustmentslist.value.value
        .add(AddToOrderButtonModelEntity.value.data7);
    // Operation();
  }

  Future<void> addToOrdersApi({
    product_id,
    qty,
    line_sku,
    line_dsc,
    line_value,
  }) async {
    var baseUrl = 'winemonger.nintriva.com';
    var endpoint = 'api/create/preOrderLines';
    var headers = {
      "APIKEY": "owxdR7uk3HWimq9MO6CleX8Kt",
    };

    print(product_id.runtimeType);
    print(qty.runtimeType);
    print(line_sku.runtimeType);
    // print(linedsc);
    print(line_value.runtimeType);
    print(customerController2.value.runtimeType);

    var url = Uri.http(baseUrl, endpoint);
    try {
      var response = await http.post(
        url,
        headers: headers,
        body: jsonEncode(
          {
            "OrdersLines": {
              "product_id":
                  // "2852",
                  "$product_id",
              "qty":
                  // "12",
                  "${qty}",
              "line_sku":
                  // "BV026",
                  "${line_sku}",
              "line_dsc":
                  // "Bio Vio Aimone Vermentino 2016",
                  "${line_dsc}",
              "line_value":
                  // "16.5000",
                  "${line_value}"
            },
            "customer_id": "1243",
            //"${customerController1.value.text}",
            "total_pre_orderline_id": "",
            "pre_orderline_id": "",
            "total": "",
            "discount_total": "",
            "product_ware_house_id": "",
            // "$product_ware_house_id",
            "line_number": ""
            //  "$line_number"
          },
        ),
      );
      print(response);
      if (response.statusCode == 200) {
        AddToOrderButtonModelEntity.value =
            AddToOrderButtonModel.fromJson(jsonDecode(response.body));
        // await totalcalculation();

        print("...addto......");
        print(AddToOrderButtonModelEntity.value.toJson());
      } else {
        print("no...data... found..");
        throw Exception('failed to select product');
      }
    } catch (e) {
      print(e.toString());
    }
    update();
  }

  RxDouble total1 = (0.0).obs;

  totalcalculation() async {
    var total2 = 0.0;
    for (var amount in bulkAddAdjustmentslist.value.value) {
      // print(amount.total!);
      var ravi = await double.tryParse(amount.total!.toString());

      total2 += ravi!;
      print(ravi.runtimeType);
      print(total2);
    }
    total1.value = total2;
  }

  var deleteproductmodelEntity = DeletProductModel().obs;

  void removeToOrders() async {
    await removeToOrdersApi();
    addToOrders.value = false;
  }

  Future<void> removeToOrdersApi(
      {id,
      totalPreOrderlineId,
      total,
      lineNumber,
      del_warehouseId,
      del_lineNumber}) async {
    var baseUrl = 'winemonger.nintriva.com';
    var endpoint = 'api/delete/preOrderLines';
    var headers = {"APIKEY": "owxdR7uk3HWimq9MO6CleX8Kt"};

    var url = Uri.http(baseUrl, endpoint);
    try {
      var response = await http.delete(
        url,
        headers: headers,
        body: jsonEncode(
          {
            "id":
                // "1673630",
                "${id}",
            "total":
                //  198,
                total,
            "total_pre_orderline_id":
                //"167630",
                "${totalPreOrderlineId}",
            "line_number": lineNumber,
            // "1",
            "del_warehouse_id": del_warehouseId,
            // 0,
            "del_lineNumber": del_lineNumber
            // "1"
          },
        ),
      );
      print(response.toString());
      print(response.statusCode);
      if (response.statusCode == 200) {
        deleteproductmodelEntity.value =
            DeletProductModel.fromJson(jsonDecode(response.body));

        //isInitialized.value = true;
        print('deleted product');
        print(AddToOrderButtonModelEntity.value.toJson());
      } else {
        print('HI');
        throw Exception('Failed to delete product');
      }
    } catch (e) {
      print(e.toString());
    }
    update();
  }

  Future<void> removeAdjustmentAPi({id, total, totalPreorderlineid}) async {
    var baseUrl = 'winemonger.nintriva.com';
    var endpoint = 'api/delete/preOrderLines';
    var headers = {"APIKEY": "owxdR7uk3HWimq9MO6CleX8Kt"};

    var url = Uri.http(baseUrl, endpoint);
    try {
      var response = await http.delete(
        url,
        headers: headers,
        body: jsonEncode(
          {
            "id": "${id}",
            "total": total,
            "total_pre_orderline_id": "${totalPreorderlineid}",
            "line_number": 5,
            "del_warehouse_id": 0,
            "del_lineNumber": 5
          },
        ),
      );
      print(response);
      if (response.statusCode == 200) {
        RemoveAdjustmentModelEntity.value =
            RemoveAdjustment.fromJson(jsonDecode(response.body));
        //isInitialized.value = true;
        print('deleted adjproduct');
        print(AddToOrderButtonModelEntity.value.toJson());
      } else {
        print('HI');
        throw Exception('Failed to delete adjproduct');
      }
    } catch (e) {
      print(e.toString());
    }
    update();
  }

  void addAdjustmentOrder(operator) async {
    final isValid6 = formKey6.currentState!.validate();
    Get.focusScope!.unfocus();
    if (isValid6) {
      formKey6.currentState!.save();
      // addToOrders1.value = false;
      print(quantityController1.value.text);
      await addAdjustmentOrderconfirmApi(operator);
      // addToOrders1.value = false;
      await bulklistApi();
      addToOrders1.value = false;
      update();
      refresh();
    }
  }

  adjustmentView() {
    addToOrders.value = true;
    addadjustments.value = false;
    update();
  }

  void setSelected3(String value) {
    adjustmentselected.value = value;
    update();
  }

  Future<void> addAdjustmentOrderconfirmApi(operator) async {
    var _baseUrl = 'winemonger.nintriva.com';
    var endpoint = 'api/create/preOrderLines';
    var headers = {"APIKEY": 'winemonger.nintriva.com'};
    print(adjustmentselected.value as String);
    print('$operator ${quantityController1.value.text}');
    print('$operator ${quantityController1.value.text}');
    var url = Uri.http(_baseUrl, endpoint);
    try {
      var response = await http.post(
        url,
        headers: headers,
        body: jsonEncode({
          "OrdersLines": {
            "qty": 1,
            "adjustment_id":
                //  "1",
                adjustmentselected.value,
            "line_value":
                // "-10.00"
                "$operator${quantityController1.value.text}"
          },
          "customer_id": "1805",
          "total_pre_orderline_id": "1673259",
          "pre_orderline_id": "10012334",
          "total":
              // "16.60",
              "$operator${quantityController1.value.text}",
          "discount_total": "",
          "product_ware_house_id": "29",
          "line_number": 2,
        }),
      );
      print(response);
      if (response.statusCode == 200) {
        AddAdjustmentsToOrdersModelEntity.value =
            AddAdjustmentToOrderModel.fromJson(jsonDecode(response.body));
        //isInitialized.value = true;
        print('addadjustment active;,,,,,,,');
        print(AddAdjustmentsToOrdersModelEntity.value.toJson());
      } else {
        print('addadjstmt faild.....');
        throw Exception('Failed to SELECT product');
      }
    } catch (e) {
      print(e.toString());
    }
    update();
  }

  Future<void> bulklistApi() async {
    bulkAddAdjustmentslist.value.value
        .add(AddAdjustmentsToOrdersModelEntity.value.data10);
    update();
  }
}
