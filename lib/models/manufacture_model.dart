import 'dart:convert';

ManuFactureModel manuFactureModelFromJson(String str) =>
    ManuFactureModel.fromJson(json.decode(str));

String manuFactureModelToJson(ManuFactureModel data) =>
    json.encode(data.toJson());

class ManuFactureModel {
  ManuFactureModel({
    this.code,
    this.totalItem,
    this.dataone,
  });

  int? code;
  String? totalItem;
  List<DatumOne>? dataone;

  factory ManuFactureModel.fromJson(Map<String, dynamic> json) =>
      ManuFactureModel(
        code: json["code"],
        totalItem: json["total_item"],
        dataone:
            List<DatumOne>.from(json["data"].map((x) => DatumOne.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "total_item": totalItem,
        "data": List<dynamic>.from(dataone!.map((x) => x.toJson())),
      };
}

class DatumOne {
  DatumOne({
    required this.manId,
    required this.manName,
  });

  String manId;
  String manName;

  factory DatumOne.fromJson(Map<String, dynamic> json) => DatumOne(
        manId: json["man_id"],
        manName: json["man_name"],
      );

  Map<String, dynamic> toJson() => {
        "man_id": manId,
        "man_name": manName,
      };
}
