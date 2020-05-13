import 'package:flutter/material.dart';
import 'package:hajeej/models/home_model.dart';
import 'package:hajeej/screens/Fadl_elhaj.dart';

class BottomCards extends StatelessWidget {
  Data mData;

  BottomCards(this.mData);

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Row(
          children: <Widget>[
            GestureDetector(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 0.5,
                          spreadRadius: 1.2,
                          color: Colors.grey,
                          offset: Offset(0.5, 0.8))
                    ],

                  ),
                  child: Stack(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(35),
                        ),
                        height: 350,
                        width: MediaQuery.of(context).size.width,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(35),
                          child: Image.network(mData.mnaskAlhajjImage,
                              fit: BoxFit.fill),
                        ),
                      ),
                      Positioned(
                          bottom: 0,
                          child: Container(
                            height: 90,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(30),
                                  bottomRight: Radius.circular(30)),
                            ),
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                'فضل الحج',
                                style: TextStyle(
                                    fontSize: 40, fontWeight: FontWeight.bold,
                                fontFamily: 'Cairo'),
                              ),
                            ),
                          ))
                    ],
                  ),
                ),
                onTap: () {
                  Navigator.pushNamed(context, FadlElHaj.id);
                }),
            SizedBox(
              width: 40,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 0.5,
                      spreadRadius: 0.19,
                      color: Colors.grey,
                      offset: Offset(0.5, 0.8))
                ],
              ),
              child: Stack(
                children: <Widget>[
                  Container(
                    height: 350,
                    width: MediaQuery.of(context).size.width,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(35),
                      child: Image.network(
                        mData.fdlAlhajjImage,
                        fit: BoxFit.fill,
                      ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                  ),
                  Positioned(
                      bottom: 0,
                      child: Container(
                        height: 90,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(30),
                              bottomRight: Radius.circular(30)),
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            ' مناسك الحج',
                            style: TextStyle(
                                fontSize: 40, fontWeight: FontWeight.bold,
                            fontFamily: 'Cairo'),
                          ),
                        ),
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
