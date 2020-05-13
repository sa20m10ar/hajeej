
  import 'package:dio/dio.dart';
  import 'package:flutter/material.dart';
  import 'package:flutter_html/flutter_html.dart';
  import 'package:hajeej/models/carddetail_model.dart';
  import 'package:hajeej/services/PrefService.dart';
  import 'package:hajeej/services/api.dart';
  import 'package:intl/intl.dart'as intl;

class CardDetail extends StatefulWidget {
  int id;

  CardDetail(this.id);

  @override
  _CardDetailState createState() => _CardDetailState();
}

class _CardDetailState extends State<CardDetail> {
  var pref = PrefService.controller;

  var api = Api();

  Data mData;

  Future<bool> getCardDetails() async {
    Response response = await api.cardDetails(widget.id.toString());
    CardDetai model = CardDetai.fromJson(response.data);
    mData = model.data;

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getCardDetails(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Scaffold(body: Center(child: CircularProgressIndicator()));
          } else {
            final dateFormatter = intl.DateFormat('yyyy-MM-dd');
            final date = dateFormatter.format(mData.createdAt);
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.black,
                centerTitle: true,
                title: Text(
                  mData.name,
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Cairo',
                      fontWeight: FontWeight.bold),
                ),
              ),
              body: Container(
                width: MediaQuery.of(context).size.width,
                child: ListView(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(bottom: 10),
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height / 3,
                          child: Image.network(
                            mData.image,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: Container(
                            padding: EdgeInsets.only(right: 10),
                            child: Text(mData.name,
                                style: TextStyle(
                                    fontSize: 18,
                                    fontFamily: 'Cairo',
                                    fontWeight: FontWeight.bold)),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: Container(
                            padding: EdgeInsets.only(right: 10),
                            child: Text(
                              date,
                              style: TextStyle(fontSize: 18, fontFamily: 'Cairo'),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            child: Directionality(
                              textDirection: TextDirection.rtl,
                              child: Html(
                                padding: EdgeInsets.all(5),
                                defaultTextStyle: TextStyle(
                                  color: Colors.grey[900],
                                  fontFamily: "Cairo"
                                ),
                                data: mData.content,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }
        });
  }
}
