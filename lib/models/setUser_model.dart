// To parse this JSON data, do
//
//     final setUserModel = setUserModelFromJson(jsonString);

import 'dart:convert';

SetUserModel setUserModelFromJson(String str) => SetUserModel.fromJson(json.decode(str));

String setUserModelToJson(SetUserModel data) => json.encode(data.toJson());

class SetUserModel {
    int status;
    Data data;

    SetUserModel({
        required this.status,
        required this.data,
    });

    factory SetUserModel.fromJson(Map<String, dynamic> json) => SetUserModel(
        status: json["status"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": data.toJson(),
    };
}

class Data {
    String displayname;
    String id;

    Data({
        required this.displayname,
        required this.id,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        displayname: json["displayname"],
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "displayname": displayname,
        "id": id,
    };
}
