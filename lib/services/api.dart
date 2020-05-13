import 'package:dio/dio.dart';
import 'package:hajeej/services/PrefService.dart';

class Api {
  Dio dio;
  String baseUrl = "https://demo.hajjej.com/api/";

  Api() {
    dio = Dio()
      ..interceptors.add(LogInterceptor(
          responseBody: true,
          requestBody: true,
          requestHeader: true,
          request: true,
          responseHeader: true));
  }

  var pref = PrefService.controller;

  Future<Response> onLogin({String email, String password}) {
    Map<String, dynamic> body = {
      "identity": email,
      "password": password,
    };

    return dio.post(baseUrl + "auth/login", data: body);
  }

  Future<Response> homeData() {
    Map<String, dynamic> header = {
      "Authorization": " Bearer ${pref.userToken}",
    };
    return dio.get(baseUrl + "home", options: Options(headers: header));
  }

  Future<Response> fadlHaj() {
    Map<String, dynamic> header = {
      "Authorization": " Bearer ${pref.userToken}",
    };
    return dio.get(baseUrl + "fdl-elhajj", options: Options(headers: header));
  }

  Future<Response> onLogOut() {
    Map<String, dynamic> header = {
      "X-Requested-With": 'XMLHttpRequest',
      "Authorization": " Bearer ${pref.userToken}",
    };
    return dio.post(baseUrl + "auth/logout", options: Options(headers: header));
  }

  Future<Response> albumes() {
    Map<String, dynamic> header = {
      "Authorization": " Bearer ${pref.userToken}",
    };
    return dio.get(baseUrl + "gallery", options: Options(headers: header));
  }

  Future<Response> allImages(String id) {
    Map<String, dynamic> header = {
      "Authorization": " Bearer ${pref.userToken}",
    };
    Map<String, dynamic> query = {
      "album_id": id,
    };
    return dio.get(baseUrl + "gallery/images",
        options: Options(headers: header), queryParameters: query);
  }

  Future<Response> cardDetails(String id) {
    Map<String, dynamic> header = {
      "Authorization": " Bearer ${pref.userToken}",
    };

    return dio.get(baseUrl + "news/$id/show",
        options: Options(headers: header));
  }
}
