import 'package:flutter/material.dart';
import 'package:hajeej/screens/Barcode.dart';
import 'package:hajeej/screens/chats_screen.dart';
import 'package:hajeej/screens/gallery.dart';
import 'package:hajeej/screens/home.dart';
import 'package:hajeej/screens/profile.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomNavigation extends StatefulWidget {
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int currentIndex = 4;
  bool isSelected = false;

  final List<Widget> _children = [
    ProfileScreen(),
    ChatsScreen(),
    BarcodeScreen(),
    GalleryScreen(),
    HomeScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _children[currentIndex],
        bottomNavigationBar: ClipRRect(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15)),
          child: BottomNavigationBar(
            currentIndex: currentIndex,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.black,
            //iconSize: 20,
            selectedItemColor: Color(0xffEFB03F),
            unselectedItemColor: Colors.white,
            showSelectedLabels: true,
            showUnselectedLabels: false,

            items: [
              currentIndex == 0
                  ? BottomNavigationBarItem(
                icon: Container(
                  width: 7,
                  height: 7,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Color(0xffEFB03F)),
                ),
                title: Text(
                  'الملف الشخصى',
                  style: TextStyle(color: Color(0xffEFB03F)),
                ),
              )
                  :
              BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage('assets/icons/profile.png'),
                  color: Colors.white,
                  size: 18,
                ),
                title: Text(
                  'الملف الشخصى',
                  style: TextStyle(color: Color(0xffEFB03F)),
                ),
              ),
              currentIndex == 1
                  ? BottomNavigationBarItem(
                icon: Container(
                  width: 7,
                  height: 7,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Color(0xffEFB03F)),
                ),
                title: Text(
                  'الدردشه',
                  style: TextStyle(color: Color(0xffEFB03F)),
                ),
              )
                  :
              BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage('assets/icons/chat.png'),
                  color: Colors.white,
                  size: 18,
                ),
                title: Text(
                  'الدردشه',
                  style: TextStyle(color: Color(0xffEFB03F)),
                ),
              ),
              currentIndex == 2
                  ? BottomNavigationBarItem(
                icon: Container(
                  width: 7,
                  height: 7,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Color(0xffEFB03F)),
                ),
                title: Text(
                  'فحص',
                  style: TextStyle(color: Color(0xffEFB03F)),
                ),
              )
                  :
              BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage('assets/icons/scan.png'),
                  color: Colors.white,
                  size: 18,
                ),
                title: Text(
                  'فحص',
                  style: TextStyle(color: Color(0xffEFB03F)),
                ),
              ),
              currentIndex == 3
                  ? BottomNavigationBarItem(
                icon: Container(
                  width: 7,
                  height: 7,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Color(0xffEFB03F)),
                ),
                title: Text(
                  'معرض الصور',
                  style: TextStyle(color: Color(0xffEFB03F)),
                ),
              )
                  :
              BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage(
                    'assets/icons/image.png',
                  ),
                  color: Colors.white,
                  size: 18,
                ),
                title: Text(
                  'معرض الصور',
                  style: TextStyle(color: Color(0xffEFB03F)),
                ),
              ),
              currentIndex == 4
                  ? BottomNavigationBarItem(
                      icon: Container(
                        width: 7,
                        height: 7,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Color(0xffEFB03F)),
                      ),
                      title: Text(
                        'الرئيسيه',
                        style: TextStyle(color: Color(0xffEFB03F)),
                      ),
                    )
                  : BottomNavigationBarItem(
                      icon: ImageIcon(
                        AssetImage('assets/icons/homex.png'),
                        color: Colors.white,
                        size: 20,
                      ),
                      title: Text(
                        'الرئيسيه',
                        style: TextStyle(color: Color(0xffEFB03F)),
                      ),
                    ),
            ],
            onTap: (index) {
              setState(() {
                currentIndex = index;
              });
            },
          ),
        ));
  }
}
