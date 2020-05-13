// To parse this JSON data, do
//
//     final home = homeFromJson(jsonString);

import 'dart:convert';

Home homeFromJson(String str) => Home.fromJson(json.decode(str));

String homeToJson(Home data) => json.encode(data.toJson());

class Home {
  Data data;
  bool status;
  int code;
  dynamic error;

  Home({
    this.data,
    this.status,
    this.code,
    this.error,
  });

  factory Home.fromJson(Map<String, dynamic> json) => Home(
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
  CurrentWeatherM currentWeatherMakkah;
  CurrentWeatherM currentWeatherMedina;
  String logo;
  String homeImage;
  PrayTimes prayTimes;
  List<HomeNew> homeNews;
  String mnaskAlhajjImage;
  String fdlAlhajjImage;
  int notificationsCount;

  Data({
    this.currentWeatherMakkah,
    this.currentWeatherMedina,
    this.logo,
    this.homeImage,
    this.prayTimes,
    this.homeNews,
    this.mnaskAlhajjImage,
    this.fdlAlhajjImage,
    this.notificationsCount,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        currentWeatherMakkah:
            CurrentWeatherM.fromJson(json["current_weather_makkah"]),
        currentWeatherMedina:
            CurrentWeatherM.fromJson(json["current_weather_medina"]),
        logo: json["logo"],
        homeImage: json["home_image"],
        prayTimes: PrayTimes.fromJson(json["pray_times"]),
        homeNews: List<HomeNew>.from(
            json["homeNews"].map((x) => HomeNew.fromJson(x))),
        mnaskAlhajjImage: json["mnask_alhajj_image"],
        fdlAlhajjImage: json["fdl_alhajj_image"],
        notificationsCount: json["notifications_count"],
      );

  Map<String, dynamic> toJson() => {
        "current_weather_makkah": currentWeatherMakkah.toJson(),
        "current_weather_medina": currentWeatherMedina.toJson(),
        "logo": logo,
        "home_image": homeImage,
        "pray_times": prayTimes.toJson(),
        "homeNews": List<dynamic>.from(homeNews.map((x) => x.toJson())),
        "mnask_alhajj_image": mnaskAlhajjImage,
        "fdl_alhajj_image": fdlAlhajjImage,
        "notifications_count": notificationsCount,
      };
}

class CurrentWeatherM {
  String city;
  String lastUpdate;
  String summary;
  String icon;
  int temperature;

  CurrentWeatherM({
    this.city,
    this.lastUpdate,
    this.summary,
    this.icon,
    this.temperature,
  });

  factory CurrentWeatherM.fromJson(Map<String, dynamic> json) =>
      CurrentWeatherM(
        city: json["city"],
        lastUpdate: json["last_update"],
        summary: json["summary"],
        icon: json["icon"],
        temperature: json["temperature"],
      );

  Map<String, dynamic> toJson() => {
        "city": city,
        "last_update": lastUpdate,
        "summary": summary,
        "icon": icon,
        "temperature": temperature,
      };
}

class HomeNew {
  int id;
  String name;
  String content;
  String image;
  DateTime createdAt;

  HomeNew({
    this.id,
    this.name,
    this.content,
    this.image,
    this.createdAt,
  });

  factory HomeNew.fromJson(Map<String, dynamic> json) => HomeNew(
        id: json["id"],
        name: json["name"],
        content: json["content"],
        image: json["image"],
        createdAt: DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "content": content,
        "image": image,
        "created_at":
            "${createdAt.year.toString().padLeft(4, '0')}-${createdAt.month.toString().padLeft(2, '0')}-${createdAt.day.toString().padLeft(2, '0')}",
      };
}

class PrayTimes {
  String fajr;
  String doha;
  String dohr;
  String asr;
  String maghrb;
  String ishaa;

  PrayTimes({
    this.fajr,
    this.doha,
    this.dohr,
    this.asr,
    this.maghrb,
    this.ishaa,
  });

  factory PrayTimes.fromJson(Map<String, dynamic> json) => PrayTimes(
        fajr: json["fajr"],
        doha: json["doha"],
        dohr: json["dohr"],
        asr: json["asr"],
        maghrb: json["maghrb"],
        ishaa: json["ishaa"],
      );

  Map<String, dynamic> toJson() => {
        "fajr": fajr,
        "doha": doha,
        "dohr": dohr,
        "asr": asr,
        "maghrb": maghrb,
        "ishaa": ishaa,
      };
}
