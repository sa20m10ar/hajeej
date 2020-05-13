import 'package:flutter/material.dart';
import 'package:hajeej/models/home_model.dart';

class Weather1 extends StatelessWidget {
  Data mData;

  Weather1(this.mData);

  @override
  Widget build(BuildContext context) {

    return Container(
      width: MediaQuery.of(context).size.width / 1.1,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            "assets/icons/wwzz2.png",
          ),
          fit: BoxFit.fill,
        ),
        borderRadius: BorderRadius.all(Radius.circular(30)),
      ),

      child: FittedBox(
        child: Row(
          children: <Widget>[
            SizedBox(
              width: 25,
            ),
            Column(
              children: <Widget>[
                Text(
                  mData.currentWeatherMedina.city,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      fontFamily: 'Cairo',
                      color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                Text(mData.currentWeatherMedina.summary,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontFamily: 'Cairo',
                    ))
              ],
            ),
            SizedBox(
              width: 20,
            ),
            Text(mData.currentWeatherMedina.temperature.toString(),
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Colors.white,
                fontFamily: 'Cairo')),
//             Text(mData.currentWeatherMedina.icon,
//                 style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 25,
//                     color: Colors.white)),
//            SizedBox(
//              width: 10,
//            ),
            Container(
              width: MediaQuery.of(context).size.width / 3,
              child: Image.asset(
                'assets/icons/sun.png',
                alignment: Alignment.topRight,
              ),
            )
          ],
        ),
      ),
    );
  }
}
