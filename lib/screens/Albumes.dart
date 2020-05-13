import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hajeej/models/Albumes_model.dart';
import 'package:hajeej/screens/Album_detail.dart';
import 'package:hajeej/services/PrefService.dart';
import 'package:hajeej/services/api.dart';

class AllAlbumes extends StatefulWidget {
  @override
  _AllAlbumesState createState() => _AllAlbumesState();
}

class _AllAlbumesState extends State<AllAlbumes> {
  var pref = PrefService.controller;
  var api = Api();

  bool isLoading = false;

  List<Datum> mdata;

  getAlbumes() async {
    setState(() {
      isLoading = true;
    });

    Response response = await api.albumes();
    Albumes model = Albumes.fromJson(response.data);
    mdata = model.data;

    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getAlbumes();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: mdata.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (BuildContext context) {
                      return AlbumDetail(mdata[index].id, mdata[index].name);
                    }
                    )
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    width: MediaQuery.of(context).size.width,
                    child: Stack(
                      children: <Widget>[
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.network(
                            mdata[index].cover,
                            width: MediaQuery.of(context).size.width,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Positioned(
                            bottom: 0,
                            child: Container(
                             padding: EdgeInsets.all(5),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.only(
                                        top: 15,
                                        bottom: 15,
                                        left: 15,
                                        right: 15),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(25)),
                                      color: Colors.white,
                                    ),
                                    child: Text(
                                      mdata[index].multimediaCount.toString(),
                                      style: TextStyle(
                                          fontSize: 17.0,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 200,
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(
                                        top: 5,
                                        bottom: 5,
                                        left: 10,
                                        right: 10),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(15)),
                                      color: Colors.white,
                                    ),
                                    child: Text(
                                      mdata[index].name,
                                      style: TextStyle(
                                          fontSize: 17.0,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                            ))
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
