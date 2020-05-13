// To parse this JSON data, do
//
//     final cardDetail = cardDetailFromJson(jsonString);

import 'dart:convert';

CardDetai cardDetailFromJson(String str) => CardDetai.fromJson(json.decode(str));

String cardDetailToJson(CardDetai data) => json.encode(data.toJson());

class CardDetai {
  Data data;
  bool status;
  int code;
  dynamic error;

  CardDetai({
    this.data,
    this.status,
    this.code,
    this.error,
  });

  factory CardDetai.fromJson(Map<String, dynamic> json) => CardDetai(
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
  int id;
  int seasonId;
  dynamic userId;
  String name;
  String content;
  String type;
  String image;
  DateTime createdAt;
  DateTime updatedAt;

  Data({
    this.id,
    this.seasonId,
    this.userId,
    this.name,
    this.content,
    this.type,
    this.image,
    this.createdAt,
    this.updatedAt,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    seasonId: json["season_id"],
    userId: json["user_id"],
    name: json["name"],
    content: json["content"],
    type: json["type"],
    image: json["image"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "season_id": seasonId,
    "user_id": userId,
    "name": name,
    "content": content,
    "type": type,
    "image": image,
    "created_at": "${createdAt.year.toString().padLeft(4, '0')}-${createdAt.month.toString().padLeft(2, '0')}-${createdAt.day.toString().padLeft(2, '0')}",
    "updated_at": "${updatedAt.year.toString().padLeft(4, '0')}-${updatedAt.month.toString().padLeft(2, '0')}-${updatedAt.day.toString().padLeft(2, '0')}",
  };
}
