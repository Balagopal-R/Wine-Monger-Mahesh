// To parse this JSON data, do
//
//     final addToOrderButtonModel = addToOrderButtonModelFromJson(jsonString);

import 'dart:convert';

AddToOrderButtonModel addToOrderButtonModelFromJson(String str) =>
    AddToOrderButtonModel.fromJson(json.decode(str));

String addToOrderButtonModelToJson(AddToOrderButtonModel data7) =>
    json.encode(data7.toJson());

class AddToOrderButtonModel {
  AddToOrderButtonModel({
    this.code,
    this.noqty,
    required this.data7,
    this.message,
  });

  int? code;
  int? noqty;
  Data7 data7;
  String? message;

  factory AddToOrderButtonModel.fromJson(Map<String, dynamic> json) =>
      AddToOrderButtonModel(
        code: json["code"],
        noqty: json["noqty"],
        data7: Data7.fromJson(json["data"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "noqty": noqty,
        "data": data7.toJson(),
        "message": message,
      };
}

class Data7 {
  Data7({
    this.lineDsc,
    this.sku,
    this.value,
    this.qty,
    this.total,
    this.id,
    this.totalPreOrderlineId,
    this.preOrderlineId,
    this.productWareHouseId,
    this.lineNumber,
  });

  String? lineDsc;
  String? sku;
  String? value;
  String? qty;
  double? total;
  String? id;
  String? totalPreOrderlineId;
  String? preOrderlineId;
  String? productWareHouseId;
  String? lineNumber;

  factory Data7.fromJson(Map<String, dynamic> json) => Data7(
        lineDsc: json["line_dsc"],
        sku: json["sku"],
        value: json["value"],
        qty: json["qty"],
        total: json["total"].toDouble(),
        id: json["id"],
        totalPreOrderlineId: json["total_pre_orderline_id"],
        preOrderlineId: json["pre_orderline_id"],
        productWareHouseId: json["product_ware_house_id"],
        lineNumber: json["line_number"],
      );

  Map<String, dynamic> toJson() => {
        "line_dsc": lineDsc,
        "sku": sku,
        "value": value,
        "qty": qty,
        "total": total,
        "id": id,
        "total_pre_orderline_id": totalPreOrderlineId,
        "pre_orderline_id": preOrderlineId,
        "product_ware_house_id": productWareHouseId,
        "line_number": lineNumber,
      };
}
