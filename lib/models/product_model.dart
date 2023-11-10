// To parse this JSON data, do
//
//     final filterProductModel = filterProductModelFromJson(jsonString);

import 'dart:convert';

FilterProductModel filterProductModelFromJson(String str) =>
    FilterProductModel.fromJson(json.decode(str));

String filterProductModelToJson(FilterProductModel data2) =>
    json.encode(data2.toJson());

class FilterProductModel {
  FilterProductModel({
    this.code,
    required this.data2,
  });

  int? code;
  NewData data2;

  factory FilterProductModel.fromJson(Map<String, dynamic> json) =>
      FilterProductModel(
        code: json["code"],
        data2: NewData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "data": data2.toJson(),
      };
}

class NewData {
  NewData({
    this.code,
    this.totalItem,
    required this.data3,
  });

  int? code;
  String? totalItem;
  List<Datumproduct> data3;

  factory NewData.fromJson(Map<String, dynamic> json) => NewData(
        code: json["code"],
        totalItem: json["total_item"],
        data3: List<Datumproduct>.from(
            json["data"].map((x) => Datumproduct.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "total_item": totalItem,
        "data": List<dynamic>.from(data3.map((x) => x.toJson())),
      };
}

class Datumproduct {
  Datumproduct({
    this.id,
    this.name,
    this.price,
    this.wholesalePrice,
    this.onHand,
    this.resCs,
    this.reservations,
    this.onHandCs,
    this.manName,
    this.isDropshipper,
    this.isBundle,
  });

  String? id;
  String? name;
  String? price;
  String? wholesalePrice;
  String? onHand;
  String? resCs;
  String? reservations;
  String? onHandCs;
  String? manName;
  String? isDropshipper;
  String? isBundle;

  factory Datumproduct.fromJson(Map<String, dynamic> json) => Datumproduct(
        id: json["id"],
        name: json["name"],
        price: json["price"],
        wholesalePrice: json["wholesale_price"],
        onHand: json["on_hand"],
        resCs: json["res_cs"],
        reservations: json["reservations"],
        onHandCs: json["on_hand_cs"],
        manName: json["man_name"],
        isDropshipper: json["is_dropshipper"],
        isBundle: json["is_bundle"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "wholesale_price": wholesalePrice,
        "on_hand": onHand,
        "res_cs": resCs,
        "reservations": reservations,
        "on_hand_cs": onHandCs,
        "man_name": manName,
        "is_dropshipper": isDropshipper,
        "is_bundle": isBundle,
      };
}
