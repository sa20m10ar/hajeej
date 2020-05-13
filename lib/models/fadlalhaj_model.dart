// To parse this JSON data, do
//
//     final fadlHaj = fadlHajFromJson(jsonString);

import 'dart:convert';

FadlHaj fadlHajFromJson(String str) => FadlHaj.fromJson(json.decode(str));

String fadlHajToJson(FadlHaj data) => json.encode(data.toJson());

class FadlHaj {
  Data data;
  bool status;
  int code;
  dynamic error;

  FadlHaj({
    this.data,
    this.status,
    this.code,
    this.error,
  });

  factory FadlHaj.fromJson(Map<String, dynamic> json) => FadlHaj(
        data: Data.fromJson(json["data"]),
        status: json["status"],
        code: json["code"],
        error: json["error"],
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "status": status,
        "code": code,
        "error": error,
      };
}

class Data {
  String screenTitle;
  String contentTitle;
  String contentBody;

  Data({
    this.screenTitle,
    this.contentTitle,
    this.contentBody,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        screenTitle: json["screen_title"],
        contentTitle: json["content_title"],
        contentBody: json["content_body"],
      );

  Map<String, dynamic> toJson() => {
        "screen_title": screenTitle,
        "content_title": contentTitle,
        "content_body": contentBody,
      };
}
