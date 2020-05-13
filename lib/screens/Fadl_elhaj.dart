import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hajeej/models/fadlalhaj_model.dart';
import 'package:hajeej/services/PrefService.dart';
import 'package:hajeej/services/api.dart';
import 'package:flutter_html/flutter_html.dart';

class FadlElHaj extends StatelessWidget {
  static const String id = 'FadlElHaj';

  var pref = PrefService.controller;
  var api = Api();

  Data mData;
  Future<bool> getFadlElhajj() async {
    Response response = await api.fadlHaj();
    FadlHaj model = FadlHaj.fromJson(response.data);
    mData = model.data;
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getFadlElhajj(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return Scaffold(body: Center(child: CircularProgressIndicator()));
          } else {
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.black,
                title: Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      mData.screenTitle,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    )),
              ),
              body: Column(
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width,
                      height: 20,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.fitWidth,
                          image: AssetImage(
                            "assets/fadlline.png",
                          ),
                        ),
                      )),
                  Container(
                    child: Text(
                      'بسم الله الرحمن الرحيم',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                  Container(
                      height: 20,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.fitWidth,
                          image: AssetImage("assets/fadlline.png"),
                        ),
                      )),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    child: Text(
                      mData.contentTitle,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.red),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: Html(
                      data: mData.contentBody,
                    ),
                  ),
                ],
              ),
            );
          }
        });
  }
}
