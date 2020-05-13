import 'dart:async';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:hajeej/screens/home.dart';
import 'package:hajeej/screens/login_screen.dart';
import 'package:hajeej/services/PrefService.dart';
import 'package:hajeej/widgets/bottom_navigation.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen();
  static const String id = 'SplashScreen';

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  var pref = PrefService.controller;

  Future<Timer> loadData() async {
    return new Timer(Duration(seconds: 3), onDoneLoading);
  }

  onDoneLoading() async {
    Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) =>
            pref.loginState ? BottomNavigation() : LoginScreen()));
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
  }

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/icons/splash2.png'), fit: BoxFit.cover)),
          width: MediaQuery.of(context).size.width),
    );
  }
}
