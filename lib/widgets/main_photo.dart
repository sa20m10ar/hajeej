import 'package:flutter/material.dart';
import 'package:hajeej/models/home_model.dart';

class MainPhoto extends StatelessWidget {
  Data mData;

  MainPhoto(this.mData);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      children: <Widget>[
        Stack(
          children: <Widget>[
            Image.network(
              mData.homeImage,
              height: MediaQuery.of(context).size.height * 0.39,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
            Positioned(
              bottom: 0,
              child: FittedBox(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration:
                      BoxDecoration(color: Colors.black.withOpacity(0.5)),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "العداد الالكترونى",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            fontFamily: 'Cairo'),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(
                            width: 15,
                          ),
                          GestureDetector(
                            child: Container(
                              padding: EdgeInsets.only(
                                  top: 5, bottom: 5, left: 10, right: 15),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                                color: Colors.white,
                              ),
                              child: Text(
                                'عداد الطواف',
                                style: TextStyle(
                                    fontSize: 17.0,
                                    color: Colors.black,
                                    // fontWeight: FontWeight.bold,
                                    fontFamily: 'Cairo'),
                              ),
                            ),
                          ),
                          Spacer(),
                          GestureDetector(
                            child: Container(
                              padding: EdgeInsets.only(
                                  top: 5, bottom: 5, left: 10, right: 20),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                                color: Colors.white,
                              ),
                              child: Text(
                                'عداد السعى',
                                style: TextStyle(
                                    fontSize: 17.0,
                                    color: Colors.black,
                                    //  fontWeight: FontWeight.bold,
                                    fontFamily: 'Cairo'),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ],
    ));
  }
}
