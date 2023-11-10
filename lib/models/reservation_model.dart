// To parse this JSON data, do
//
//     final reservationModel = reservationModelFromJson(jsonString);

import 'dart:convert';

ReservationModel reservationModelFromJson(String str) => ReservationModel.fromJson(json.decode(str));

String reservationModelToJson(ReservationModel data) => json.encode(data.toJson());

class ReservationModel {
    int code;
    int totalNoItems;
    List<Map<String, String>> data;

    ReservationModel({
        required this.code,
        required this.totalNoItems,
        required this.data,
    });

    factory ReservationModel.fromJson(Map<String, dynamic> json) => ReservationModel(
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
