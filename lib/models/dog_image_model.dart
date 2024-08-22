// To parse this JSON data, do
//
//     final dogResponseModel = dogResponseModelFromJson(jsonString);

import 'dart:convert';

DogResponseModel dogResponseModelFromJson(String str) =>
    DogResponseModel.fromJson(json.decode(str));

String dogResponseModelToJson(DogResponseModel data) =>
    json.encode(data.toJson());

class DogResponseModel {
  String message;
  String status;

  DogResponseModel({
    required this.message,
    required this.status,
  });

  factory DogResponseModel.fromJson(Map<String, dynamic> json) =>
      DogResponseModel(
        message: json["message"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "status": status,
      };
}
