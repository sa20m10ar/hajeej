import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hajeej/models/home_model.dart';
import 'package:hajeej/services/api.dart';
import '../widgets/main_photo.dart';
import '../widgets/prayer_times.dart';
import '../widgets/weather_1.dart';
import '../widgets/weather_2.dart';
import '../widgets/horizontal_list.dart';
import '../widgets/bottom_cards.dart';
import '../services/PrefService.dart';
import '../screens/login_screen.dart';

class HomeScreen extends StatefulWidget {
  static const String id = 'HomeScreen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var pref = PrefService.controller;
  var api = Api();

  Data mData;
  Future<bool> getHomeData() async {
    Response response = await api.homeData();
    Home model = Home.fromJson(response.data);
    mData = model.data;
    return true;
  }

  getLogOut() async {
    Response response = await api.onLogOut();
  }

  @override
  Widget build(BuildContext context) {
    print(pref.loginState);
    print(MediaQuery.of(context).size.height);

    return FutureBuilder(
      future: getHomeData(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return Scaffold(body: Center(child: CircularProgressIndicator()));
        } else {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.black,
              leading: IconButton(
                icon: Icon(
                  Icons.notifications,
                  color: Colors.white,
                ),
                onPressed: () {},
              ),
              title: Container(
                alignment: Alignment.center,
                child: Image.network(mData.logo,
                width: 170,
                height: 120,
                ),

              ),
              actions: <Widget>[
                IconButton(
                    icon: Icon(
                      Icons.exit_to_app,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (_) => Container(
                            width: MediaQuery.of(context).size.width,
                            child: Dialog(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12.0)),
                                elevation: 20,
                                child: Container(
                                  padding: EdgeInsets.all(20),
                                  width: MediaQuery.of(context).size.width,
                                  height: 200,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        'هل أنت متأكد من تسجيل الخروج؟',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      GestureDetector(
                                        onTap: () async {
                                          await getLogOut();

                                          pref.loginState = false;
                                          Navigator.pushReplacementNamed(
                                              context, LoginScreen.id);
                                        },
                                        child: Container(
                                          padding: EdgeInsets.only(
                                              top: 10, bottom: 10),
                                          alignment: Alignment.center,
                                          width:
                                              MediaQuery.of(context).size.width /
                                                  2,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(50)),
                                            color: Colors.black,
                                          ),
                                          child: Text(
                                            'تسجيل الخروج ',
                                            style: TextStyle(
                                                fontSize: 16.0,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                        child: Container(
                                          padding: EdgeInsets.only(
                                              top: 10, bottom: 10),
                                          alignment: Alignment.center,
                                          width:
                                              MediaQuery.of(context).size.width /
                                                  2,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(50)),
                                            color: Colors.black,
                                          ),
                                          child: Text(
                                            'الغاء',
                                            style: TextStyle(
                                                fontSize: 16.0,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                                //],
                                ),
                          ));
                    }),
              ],
            ),
            body: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  MainPhoto(mData),
                  PrayerTimes(mData),
                  SizedBox(
                    height: 15,
                  ),
                  Weather1(mData),
                  Weather2(mData),
                  HoriznontalList(mData),
                  BottomCards(mData),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
