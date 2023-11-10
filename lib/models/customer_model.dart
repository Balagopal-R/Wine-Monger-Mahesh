// To parse this JSON data, do
//
//     final customerModel = customerModelFromJson(jsonString);

import 'dart:convert';

CustomerModel customerModelFromJson(String str) => CustomerModel.fromJson(json.decode(str));

String customerModelToJson(CustomerModel data) => json.encode(data.toJson());

class CustomerModel {
    int? code;
    String? totalItem;
    List<Datum> data;

    CustomerModel({
        required this.code,
        required this.totalItem,
        required this.data,
    });

    factory CustomerModel.fromJson(Map<String, dynamic> json) => CustomerModel(
        code: json["code"],
        totalItem: json["total_item"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "total_item": totalItem,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    String customerId;
    Title title;
    String fname;
    String lname;
    String companyName;
    String ownerUserId;
    String isWholesale;
    String isRetail;

    Datum({
        required this.customerId,
        required this.title,
        required this.fname,
        required this.lname,
        required this.companyName,
        required this.ownerUserId,
        required this.isWholesale,
        required this.isRetail,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        customerId: json["customer_id"],
        title: titleValues.map[json["title"]]!,
        fname: json["fname"],
        lname: json["lname"],
        companyName: json["company_name"],
        ownerUserId: json["owner_user_id"],
        isWholesale: json["is_wholesale"],
        isRetail: json["is_retail"],
    );

    Map<String, dynamic> toJson() => {
        "customer_id": customerId,
        "title": titleValues.reverse[title],
        "fname": fname,
        "lname": lname,
        "company_name": companyName,
        "owner_user_id": ownerUserId,
        "is_wholesale": isWholesale,
        "is_retail": isRetail,
    };
}

enum Title {
    DR,
    EMPTY,
    MISS,
    MR,
    MRS,
    MS,
    NOT_SPECIFIED,
    TITLE_MR,
    TITLE_MRS,
    TITLE_MS
}

final titleValues = EnumValues({
    "Dr": Title.DR,
    "": Title.EMPTY,
    "Miss": Title.MISS,
    "Mr.": Title.MR,
    "Mrs.": Title.MRS,
    "Ms.": Title.MS,
    "not specified": Title.NOT_SPECIFIED,
    "Mr": Title.TITLE_MR,
    "Mrs": Title.TITLE_MRS,
    "Ms": Title.TITLE_MS
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
