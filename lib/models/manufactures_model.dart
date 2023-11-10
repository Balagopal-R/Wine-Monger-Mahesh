// To parse this JSON data, do
//
//     final manufacturesModel = manufacturesModelFromJson(jsonString);

import 'dart:convert';

ManufacturesModel manufacturesModelFromJson(String str) => ManufacturesModel.fromJson(json.decode(str));

String manufacturesModelToJson(ManufacturesModel data) => json.encode(data.toJson());

class ManufacturesModel {
    int code;
    int totalNoItems;
    List<Map<String, String>> data;

    ManufacturesModel({
        required this.code,
        required this.totalNoItems,
        required this.data,
    });

    factory ManufacturesModel.fromJson(Map<String, dynamic> json) => ManufacturesModel(
        code: json["code"],
        totalNoItems: json["Total_No_Items"],
        data: List<Map<String, String>>.from(json["data"].map((x) => Map.from(x).map((k, v) => MapEntry<String, String>(k, v)))),
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "Total_No_Items": totalNoItems,
        "data": List<dynamic>.from(data.map((x) => Map.from(x).map((k, v) => MapEntry<String, dynamic>(k, v)))),
    };
}
