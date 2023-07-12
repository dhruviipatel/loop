import 'dart:convert';

ReportModel reportModelFromJson(String str) =>
    ReportModel.fromJson(json.decode(str));

String reportModelToJson(ReportModel data) => json.encode(data.toJson());

class ReportModel {
  bool success;
  String message;
  List<Report> data;

  ReportModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory ReportModel.fromJson(Map<String, dynamic> json) => ReportModel(
        success: json["success"],
        message: json["message"],
        data: List<Report>.from(json["data"].map((x) => Report.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Report {
  int id;
  String title;
  dynamic createdAt;
  dynamic updatedAt;

  Report({
    required this.id,
    required this.title,
    this.createdAt,
    this.updatedAt,
  });

  factory Report.fromJson(Map<String, dynamic> json) => Report(
        id: json["id"],
        title: json["title"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}
