// To parse this JSON data, do
//
//     final adjustmentListModel = adjustmentListModelFromJson(jsonString);

import 'dart:convert';

AdjustmentListModel adjustmentListModelFromJson(String str) =>
    AdjustmentListModel.fromJson(json.decode(str));

String adjustmentListModelToJson(AdjustmentListModel data) =>
    json.encode(data.toJson());

class AdjustmentListModel {
  AdjustmentListModel({
    this.code,
    this.totalNoItems,
    required this.data9,
  });

  int? code;
  String? totalNoItems;
  List<Data9> data9;

  factory AdjustmentListModel.fromJson(Map<String, dynamic> json) =>
      AdjustmentListModel(
        code: json["code"],
        totalNoItems: json["Total_No_Items"],
        data9: List<Data9>.from(json["data"].map((x) => Data9.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "Total_No_Items": totalNoItems,
        "data": List<dynamic>.from(data9.map((x) => x.toJson())),
      };
}

class Data9 {
  Data9({
    this.adjustmentSkuId,
    this.vinLuxSku,
    this.adjustmentSku,
    this.adjustmentSkuDescription,
    this.defaultDescText,
    this.applyPercentage,
  });

  String? adjustmentSkuId;
  String? vinLuxSku;
  String? adjustmentSku;
  String? adjustmentSkuDescription;
  String? defaultDescText;
  String? applyPercentage;

  factory Data9.fromJson(Map<String, dynamic> json) => Data9(
        adjustmentSkuId: json["adjustment_sku_id"],
        vinLuxSku: json["VinLuxSku"],
        adjustmentSku: json["adjustment_sku"],
        adjustmentSkuDescription: json["adjustment_sku_description"],
        defaultDescText: json["default_desc_text"],
        applyPercentage: json["apply_percentage"],
      );

  Map<String, dynamic> toJson() => {
        "adjustment_sku_id": adjustmentSkuId,
        "VinLuxSku": vinLuxSku,
        "adjustment_sku": adjustmentSku,
        "adjustment_sku_description": adjustmentSkuDescription,
        "default_desc_text": defaultDescText,
        "apply_percentage": applyPercentage,
      };
}
