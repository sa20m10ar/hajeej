import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hajeej/CustomOverlayRoute.dart';
import 'package:hajeej/models/allImages_model.dart';
import 'package:hajeej/services/PrefService.dart';
import 'package:hajeej/services/api.dart';

class AlbumDetail extends StatelessWidget {

  var pref = PrefService.controller;
  var api = Api();
  var pgController = PageController();

  List<Datum> mdata;
  int id;
  String name;
  AlbumDetail(this.id, this.name);

  Future<bool> getAlbumDetai() async {
    Response response = await api.allImages(id.toString());
    Images model = Images.fromJson(response.data);
    mdata = model.data;

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getAlbumDetai(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return Scaffold(body: Center(child: CircularProgressIndicator()));
        } else {
          return Scaffold(
            appBar: AppBar(
              title: Text(name),
              backgroundColor: Colors.black,
            ),
            body: GridView.builder(
                itemCount: mdata.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    child: Container(
                      width: 140,
                      height: 140,
                      child: Image.network(
                        mdata[index].link,
                        fit: BoxFit.cover,
                      ),
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                    ),
                    onTap: () {
                      Navigator.push(context,
                          CustomOverlayRoute(page: allImage(index, context)));

                      // showDialog(
                      //   context: context,
                      //   builder: (_) => Dialog(
                      //     backgroundColor: Colors.transparent,
                      //     child: PageView.builder(
                      //       pageSnapping: true,
                      //       controller: PageController(initialPage: index),
                      //       itemCount: mdata.length,
                      //       itemBuilder: (BuildContext context, int mindex) {
                      //         return Image.network(
                      //           mdata[mindex].link,
                      //         );
                      //       },
                      //     ),
                      //   ),
                      // );
                    },
                  );
                }),
          );
        }
      },
    );
  }

  allImage(int index, BuildContext context) {
    return Dismissible(
      key: Key(mdata[index].link.toString()),
      direction: DismissDirection.up,
      onDismissed: (DismissDirection v) {
        Navigator.pop(context);
      },
      child: Column(
        children: <Widget>[
          Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          Expanded(
            child: PageView.builder(
              pageSnapping: true,
              controller: PageController(initialPage: index),
              itemCount: mdata.length,
              itemBuilder: (BuildContext context, int mindex) {
                return Image.network(
                  mdata[mindex].link,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
