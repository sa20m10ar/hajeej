import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hajeej/models/home_model.dart';
import 'package:hajeej/screens/card_detail.dart';
import 'package:intl/intl.dart';

class HoriznontalList extends StatelessWidget {
  Data mData;

  HoriznontalList(this.mData);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 200,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: mData.homeNews.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(mData.homeNews[index]),
            );
          },
        ),
      ),
    );
  }
}

class Card extends StatelessWidget {
  HomeNew homeNew;

  Card(this.homeNew);

  @override
  Widget build(BuildContext context) {
    final dateFormatter = DateFormat('yyyy-MM-dd');
    final date = dateFormatter.format(homeNew.createdAt);
//    var split = homeNew.createdAt.toString().split(" ");
//    var split2 = split[0];
    return GestureDetector (
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (BuildContext context) {
              return CardDetail(homeNew.id);
            }));
      },
      child: Container(
        width: MediaQuery.of(context).size.width / 1.2,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                blurRadius: 1.0,
                spreadRadius: 1.3,
                color: Colors.grey,
                offset: Offset(0.5, 0.9))
          ],
          color: Color(0xffF6E7C3),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Container(
          // width: MediaQuery.of(context).size.width/2,

          child: Row(
            children: <Widget>[
              Expanded(
                child: Container(
//                decoration: BoxDecoration(
//                  borderRadius: BorderRadius.all(Radius.circular(30)),
//                ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          //  'اين أجده ؟',
                          homeNew.name,
                          maxLines: 1,
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'Cairo',
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          homeNew.content,
                          style: TextStyle(fontSize: 12, fontFamily: 'Cairo'),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.end,
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Container(
                            padding:
                                EdgeInsets.symmetric(vertical: 1, horizontal: 15),
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 0.5,
                                    spreadRadius: 0.15,
                                    color: Colors.grey,
                                    offset: Offset(0.5, 0.8))
                              ],
                              borderRadius: BorderRadius.all(Radius.circular(30)),
                              color: Color(0xffEFB03F),
                            ),
                            child: Text(
                              ' المزيد ',
                              style: TextStyle(
                                  fontSize: 13.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Cairo'),
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Text(
                            date,
                          ),
                          Icon(
                            Icons.watch_later,
                            size: 20,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: CachedNetworkImage(
                  width: 130,
                  height: 130,
                  imageUrl: homeNew.image,
                  fit: BoxFit.cover,
                  placeholder: (context, url) =>
                      Center(child: new CircularProgressIndicator()),
                  errorWidget: (context, url, error) => Container(),
                ),
              ),
              SizedBox(
                width: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
