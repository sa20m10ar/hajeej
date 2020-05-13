// To parse this JSON data, do
//
//     final albumes = albumesFromJson(jsonString);

import 'dart:convert';

Albumes albumesFromJson(String str) => Albumes.fromJson(json.decode(str));

String albumesToJson(Albumes data) => json.encode(data.toJson());

class Albumes {
  List<Datum> data;
  bool status;
  int code;
  dynamic error;

  Albumes({
    this.data,
    this.status,
    this.code,
    this.error,
  });

  factory Albumes.fromJson(Map<String, dynamic> json) => Albumes(
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
  String name;
  String cover;
  int multimediaCount;

  Datum({
    this.id,
    this.name,
    this.cover,
    this.multimediaCount,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        cover: json["cover"],
        multimediaCount: json["multimedia_count"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "cover": cover,
        "multimedia_count": multimediaCount,
      };
}
