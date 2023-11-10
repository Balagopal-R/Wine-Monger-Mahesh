import 'dart:convert';

DeletProductModel removeAdjustmentFromJson(String str) =>
    DeletProductModel.fromJson(json.decode(str));

String removeAdjustmentToJson(DeletProductModel data) =>
    json.encode(data.toJson());

class DeletProductModel {
  DeletProductModel({
    this.id,
    this.total,
    this.totalPreOrderlineId,
    this.lineNumber,
    this.delWarehouseId,
    this.delLineNumber,
  });

  String? id;
  double? total;
  String? totalPreOrderlineId;
  String? lineNumber;
  int? delWarehouseId;
  String? delLineNumber;

  factory DeletProductModel.fromJson(Map<String, dynamic> json) =>
      DeletProductModel(
        id: json["id"],
        total: json["total"].toDouble(),
        totalPreOrderlineId: json["total_pre_orderline_id"],
        lineNumber: json["line_number"],
        delWarehouseId: json["del_warehouse_id"],
        delLineNumber: json["del_lineNumber"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "total": total,
        "total_pre_orderline_id": totalPreOrderlineId,
        "line_number": lineNumber,
        "del_warehouse_id": delWarehouseId,
        "del_lineNumber": delLineNumber,
      };
}
