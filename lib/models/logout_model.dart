// To parse this JSON data, do
//
//     final logOut = logOutFromJson(jsonString);

import 'dart:convert';

LogOut logOutFromJson(String str) => LogOut.fromJson(json.decode(str));

String logOutToJson(LogOut data) => json.encode(data.toJson());

class LogOut {
  String data;
  bool status;
  int code;
  dynamic error;

  LogOut({
    this.data,
    this.status,
    this.code,
    this.error,
  });

  factory LogOut.fromJson(Map<String, dynamic> json) => LogOut(
        data: json["data"],
        status: json["status"],
        code: json["code"],
        error: json["error"],
      );

  Map<String, dynamic> toJson() => {
        "data": data,
        "status": status,
        "code": code,
        "error": error,
      };
}
