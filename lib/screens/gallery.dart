import 'package:flutter/material.dart';
import 'package:hajeej/screens/Albumes.dart';
import 'package:hajeej/screens/all_images.dart';
import 'package:material_segmented_control/material_segmented_control.dart';

class GalleryScreen extends StatefulWidget {
  static const String id = 'GalleryScreen';

  @override
  _GalleryScreenState createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  int _currentSelection = 0;
  Widget currentWidget;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentWidget = AllAlbumes();
  }

  @override
  Widget build(BuildContext context) {
    Map<int, Widget> _children = {
      0: Container(
        alignment: Alignment.center,
        width: MediaQuery
            .of(context)
            .size
            .width / 3,
        child: Align(
          alignment: Alignment.center,
          child: Text(
            'الالبومات',
            textAlign: TextAlign.center,
            style: TextStyle(fontFamily: 'Cairo', fontSize: 18),
          ),
        ),
      ),
      1: Container(
        width: MediaQuery
            .of(context)
            .size
            .width / 3,
        child: Text(
          'الصور',
          textAlign: TextAlign.center,
          style: TextStyle(fontFamily: 'Cairo', fontSize: 18),
        ),
      ),
    };

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: Colors.black,
          title: Center(
            child: Text(
              'معرض الصور',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  fontFamily: 'Cairo'),
            ),
          ),
        ),
        body: Column(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),

            MaterialSegmentedControl(
              children: _children,
              selectionIndex: _currentSelection,
              borderColor: Colors.black,
              selectedColor: Colors.black,
              unselectedColor: Colors.white,
              borderRadius: 32.0,
              onSegmentChosen: (index) {
                setState(() {
                  _currentSelection = index;

                  if (_currentSelection == 0) {
                    currentWidget = AllAlbumes();
                  } else {
                    currentWidget = AllImages() ;
                  }
                });
              },
            ),

//            TabBar(
//              unselectedLabelColor: Colors.black,
//              indicatorSize: TabBarIndicatorSize.label,
//              indicator: BoxDecoration(
//                  borderRadius: BorderRadius.circular(50), color: Colors.black),
//              tabs: [
//                Tab(
//                  child: Container(
//                    decoration: BoxDecoration(
//                      borderRadius: BorderRadius.circular(50),
//                      border: Border.all(
//                        color: Colors.black,
//                        width: 1,
//                      ),
//                    ),
//                    child: Align(
//                      alignment: Alignment.center,
//                      child: Text(
//                        'الالبومات',
//                        style: TextStyle(
//                            fontWeight: FontWeight.bold, fontSize: 20),
//                      ),
//                    ),
//                  ),
//                ),
//                Tab(
//                  child: Container(
//                    decoration: BoxDecoration(
//                      borderRadius: BorderRadius.circular(50),
//                      border: Border.all(
//                        color: Colors.black,
//                        width: 1,
//                      ),
//                    ),
//                    child: Align(
//                      alignment: Alignment.center,
//                      child: Text(
//                        'الصور',
//                        style: TextStyle(
//                            fontWeight: FontWeight.bold, fontSize: 20),
//                      ),
//                    ),
//                  ),
//                ),
//              ],
//            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: currentWidget,
            ),
          ],
        ),
      ),
    );
  }
}
