import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hajeej/models/allImages_model.dart';
import 'package:hajeej/services/PrefService.dart';
import 'package:hajeej/services/api.dart';
import 'package:cached_network_image/cached_network_image.dart';

class AllImages extends StatefulWidget {
  @override
  _AllImagesState createState() => _AllImagesState();
}

class _AllImagesState extends State<AllImages> {
  var api = Api();

  List<Datum> mdata;
  var pref = PrefService.controller;

  Future<bool> getAllImages() async {
    Response response = await api.allImages("");
    Images model = Images.fromJson(response.data);
    mdata = model.data;

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getAllImages(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return Scaffold(body: Center(child: CircularProgressIndicator()));
        } else {
          return GridView.builder(
              itemCount: mdata.length,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  child: CachedNetworkImage(
                    height: 140,
                    width: 140,
                    fit: BoxFit.cover,
                    imageUrl: mdata[index].link,
                    placeholder: (context, url) =>
                        Center(child: new CircularProgressIndicator()),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (_) => Dialog(
                              child: GestureDetector(
                                child: Container(
                                  child: Image.network(
                                    mdata[index].link,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30)),
                                  ),
                                ),
                              ),
                            ));
                  },
                );
              });
        }
      },
    );
  }
}

// class DetailScreen extends StatelessWidget {
//   String link;
//   DetailScreen(this.link);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black.withOpacity(0.7),
//       body: GestureDetector(
//         child: Center(
//           child: Container(
//             child: Image.network(
//               link,
//               fit: BoxFit.cover,
//             ),
//             padding: EdgeInsets.all(15),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.all(Radius.circular(30)),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
