// To parse this JSON data, do
//
//     final tastingsModel = tastingsModelFromJson(jsonString);

import 'dart:convert';

TastingsModel tastingsModelFromJson(String str) => TastingsModel.fromJson(json.decode(str));

String tastingsModelToJson(TastingsModel data) => json.encode(data.toJson());

class TastingsModel {
    int code;
    String totalNoItems;
    List<dynamic> data;

    TastingsModel({
        required this.code,
        required this.totalNoItems,
        required this.data,
    });

    factory TastingsModel.fromJson(Map<String, dynamic> json) => TastingsModel(
        code: json["code"],
        totalNoItems: json["Total_No_Items"],
        data: List<dynamic>.from(json["data"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "Total_No_Items": totalNoItems,
        "data": List<dynamic>.from(data.map((x) => x)),
    };
}
