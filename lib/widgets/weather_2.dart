import 'package:flutter/material.dart';
import 'package:hajeej/models/home_model.dart';

class Weather2 extends StatelessWidget {
  Data mData;

  Weather2(this.mData);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.1,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/icons/wwzz.png"),
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
                Text(mData.currentWeatherMakkah.city,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Colors.white,
                      fontFamily: 'Cairo',
                    )),
                Text(mData.currentWeatherMakkah.summary,
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
            Text(mData.currentWeatherMakkah.temperature.toString(),
                // '26',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Colors.white,
                  fontFamily: 'Cairo',
                )),
            // Text(mData.currentWeatherMakkah.icon,
            //     //'26',
            //     style: TextStyle(
            //         fontWeight: FontWeight.bold,
            //         fontSize: 25,
            //         color: Colors.white)),
            SizedBox(
              width: 10.0,
            ),
            Container(
              width: MediaQuery.of(context).size.width / 4,
              child: Image.asset(
                'assets/icons/thunder.png',
                alignment: Alignment.topRight,
              ),
            )
//            Image.asset(
//              'assets/icons/thunder.png',
//            )
          ],
        ),
      ),
    );
  }
}
