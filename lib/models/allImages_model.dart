// To parse this JSON data, do
//
//     final images = imagesFromJson(jsonString);

import 'dart:convert';

Images imagesFromJson(String str) => Images.fromJson(json.decode(str));

String imagesToJson(Images data) => json.encode(data.toJson());

class Images {
  List<Datum> data;
  bool status;
  int code;
  dynamic error;

  Images({
    this.data,
    this.status,
    this.code,
    this.error,
  });

  factory Images.fromJson(Map<String, dynamic> json) => Images(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        status: json["status"],
        code: json["code"],
        error: json["error"],
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "status": status,
        "code": code,
        "error": error,
      };
}

class Datum {
  int id;
  String link;

  Datum({
    this.id,
    this.link,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        link: json["link"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "link": link,
      };
}
