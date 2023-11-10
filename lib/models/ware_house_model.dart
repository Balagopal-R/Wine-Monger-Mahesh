// import 'dart:convert';

// WarehouseModel warehouseModelFromJson(String str) =>
//     WarehouseModel.fromJson(json.decode(str));

// String warehouseModelToJson(WarehouseModel data) => json.encode(data.toJson());

class WarehouseModel {
  WarehouseModel({
    this.code,
    this.totalNoItems,
    required this.data,
  });

  int? code;
  String? totalNoItems;
  List<WareHouseDatum> data;

  factory WarehouseModel.fromJson(Map<String, dynamic> json) => WarehouseModel(
        code: json["code"],
        totalNoItems: json["Total_No_Items"],
        data: List<WareHouseDatum>.from(json["data"].map((x) => WareHouseDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "Total_No_Items": totalNoItems,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class WareHouseDatum {
  WareHouseDatum({
    this.warehouseId,
    this.warehouseName,
  });

  String? warehouseId;
  String? warehouseName;

  factory WareHouseDatum.fromJson(Map<String, dynamic> json) => WareHouseDatum(
        warehouseId: json["warehouse_id"],
        warehouseName: json["warehouse_name"],
      );

  Map<String, dynamic> toJson() => {
        "warehouse_id": warehouseId,
        "warehouse_name": warehouseName,
      };
}
