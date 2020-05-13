import 'package:flutter/material.dart';
import 'package:hajeej/screens/Barcode.dart';
import 'package:hajeej/screens/Fadl_elhaj.dart';
import 'package:hajeej/screens/chats_screen.dart';
import 'package:hajeej/screens/gallery.dart';
import 'package:hajeej/screens/profile.dart';
import './screens/login_screen.dart';
import './screens/splash_screen.dart';
import 'screens/home.dart';
import 'services/PrefService.dart';

void main() {
  runApp(

    start(),
  );
}


class start extends StatefulWidget {

  @override
  _startState createState() => _startState();
}

class _startState extends State<start> {
  @override
  void initState() {
    PrefService.controller.initPref();
  super.initState();
}

  @override
  Widget build(BuildContext context) {
    return MyApp();
  }
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      title: 'Hajeej',
      theme: ThemeData(primarySwatch: Colors.blue,),

      home: SplashScreen(),
      initialRoute: SplashScreen.id,

      routes: {
        SplashScreen.id: (context) => SplashScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        HomeScreen.id: (context) => HomeScreen(),
        FadlElHaj.id: (context) => FadlElHaj(),
        ProfileScreen.id: (context) => ProfileScreen(),
        ChatsScreen.id: (context) => ChatsScreen(),
        BarcodeScreen.id: (context) => BarcodeScreen(),
        GalleryScreen.id: (context) => GalleryScreen(),

      },
    );
  }
}
