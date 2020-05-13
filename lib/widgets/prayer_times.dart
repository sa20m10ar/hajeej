import 'package:flutter/material.dart';
import 'package:hajeej/models/home_model.dart';

class PrayerTimes extends StatelessWidget {
  Data mData;

  PrayerTimes(this.mData);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        boxShadow: [
          BoxShadow(
              blurRadius: 0.5,
              spreadRadius: 0.15,
              color: Colors.grey,
              offset: Offset(0.5, 0.8))
        ],
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FittedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text(
                    'الفجر',
                    style: TextStyle(
                        //fontWeight: FontWeight.bold,
                        fontSize: 20,
                        fontFamily: 'Cairo'),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 7, vertical: 7),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 0.5,
                            spreadRadius: 0.15,
                            color: Colors.grey,
                            offset: Offset(0.5, 0.8))
                      ],
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      color: Colors.white,
                    ),
                    child: Text(
                      mData.prayTimes.fajr,

                      // "04:00 ص",
                      style: TextStyle(
                        fontFamily: 'Cairo',
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 10,
              ),
              Column(
                children: <Widget>[
                  Text(
                    'الظهر',
                    style: TextStyle(fontFamily: 'Cairo', fontSize: 20),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 7, vertical: 7),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 0.5,
                            spreadRadius: 0.15,
                            color: Colors.grey,
                            offset: Offset(0.5, 0.8))
                      ],
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      color: Colors.white,
                    ),
                    child: Text(
                      mData.prayTimes.dohr,

                      //   "12:00 م",
                      style: TextStyle(
                        fontFamily: 'Cairo',
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 10,
              ),
              Column(
                children: <Widget>[
                  Text(
                    'العصر',
                    style: TextStyle(fontFamily: 'Cairo', fontSize: 20),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 7, vertical: 7),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 0.5,
                            spreadRadius: 0.15,
                            color: Colors.grey,
                            offset: Offset(0.5, 0.8))
                      ],
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      color: Colors.white,
                    ),
                    child: Text(
                      mData.prayTimes.asr,

                      // "03:30 م",
                      style: TextStyle(
                        fontFamily: 'Cairo',
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 10,
              ),
              Column(
                children: <Widget>[
                  Text(
                    'المغرب',
                    style: TextStyle(fontFamily: 'Cairo', fontSize: 20),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 7, vertical: 7),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 0.5,
                            spreadRadius: 0.15,
                            color: Colors.grey,
                            offset: Offset(0.5, 0.8))
                      ],
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      color: Colors.white,
                    ),
                    child: Text(
                      mData.prayTimes.maghrb,

                      //  "06:15 م",
                      style: TextStyle(
                        fontFamily: 'Cairo',
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 10,
              ),
              Column(
                children: <Widget>[
                  Text(
                    'العشاء',
                    style: TextStyle(fontFamily: 'Cairo', fontSize: 20),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 7, vertical: 7),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 0.5,
                            spreadRadius: 0.15,
                            color: Colors.grey,
                            offset: Offset(0.5, 0.8))
                      ],
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      color: Colors.white,
                    ),
                    child: Text(
                      mData.prayTimes.ishaa,

                      // "07:25 م",
                      style: TextStyle(
                        fontFamily: 'Cairo',
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
