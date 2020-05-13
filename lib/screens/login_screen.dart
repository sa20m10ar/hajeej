import 'package:flutter/material.dart';
import 'package:hajeej/models/login_model.dart';
import 'package:hajeej/services/api.dart';
import 'package:dio/dio.dart';
import 'package:hajeej/services/PrefService.dart';
import 'package:hajeej/widgets/bottom_navigation.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'LoginScreen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _showPassword = false;
  String email;
  String password;
  bool _isLoading = false;
  final _formKey = GlobalKey<FormState>();

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  TextEditingController emailController =
      TextEditingController(text: "customer@hajjej.com");
  TextEditingController passController = TextEditingController(text: "secret");

  var api = Api();
  var pref = PrefService.controller;

  getLogin(String mEmail, String mPassword) async {
    setState(() {
      _isLoading = true;
    });

    Response response = await api.onLogin(email: mEmail, password: mPassword);
    Login model = Login.fromJson(response.data);
    var mToken = model.data.accessToken;
    pref.userToken = mToken;

    setState(() {
      _isLoading = false;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/icons/gbvision.png"),
                  fit: BoxFit.cover)),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Container(
                    height: 300.0,
                    child: Image.asset('assets/icons/logo.png'),
                  ),

                  // --------------------- TextField 1 -----------------------
                  Container(
                    width: MediaQuery.of(context).size.width / 1.2,
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    child: Padding(
                      padding: EdgeInsets.only(right: 22.0, left: 10.0),
                      child: TextField(
                        onChanged: (value) {
                          email = value;
                        },
                        keyboardType: TextInputType.emailAddress,
                        textAlign: TextAlign.right,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'البريد الالكترونى',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontFamily: "Cairo",
                            fontSize: 19.0,
                          ),
                          contentPadding: EdgeInsets.only(bottom: 5,top: 5),

                          suffixIcon: Icon(
                            Icons.person,
                            size: 25.0,
                            color: Colors.black,
                          ),
                        ),
                        cursorColor: Colors.grey,
                      ),
                    ),
                  ),

                  // --------------------------------------------------------

                  SizedBox(
                    height: 20,
                  ),

                  // --------------------- TextField 2 -----------------------

                  Container(
                    width: MediaQuery.of(context).size.width / 1.2,
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    child: Padding(
                      padding: EdgeInsets.only(right: 22.0, left: 10.0),
                      child: TextField(
                        onChanged: (value) {
                          password = value;
                        },
                        //   validator: validatePassword,
                        keyboardType: TextInputType.visiblePassword,
                        textAlign: TextAlign.right,
                        // controller: passController,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'كلمة المرور',
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 19.0,
                              fontFamily: "Cairo",
                            ),
                            suffixIcon: Icon(
                              Icons.lock,
                              size: 25.0,
                              color: Colors.black,
                            ),
                            contentPadding: EdgeInsets.only(bottom: 5,top: 5),

                            prefixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _showPassword = !_showPassword;
                                });
                              },
                              child: Icon(
                                _showPassword
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                size: 25.0,
                                color: Colors.black,
                              ),
                            )),
                        obscureText: !_showPassword,
                        cursorColor: Colors.grey,
                      ),
                    ),
                  ),

                  // ------------------------------------------------------
                  SizedBox(
                    height: 20,
                  ),

                  // ------------------- Button ----------------------------

                  _isLoading
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : GestureDetector(
                          onTap: () async {
                            FocusScope.of(context).requestFocus(FocusNode());
                            _formKey.currentState.save();
                            if (email == "" || password == "") {
                              _scaffoldKey.currentState.showSnackBar(SnackBar(
                                content: Text("يجب عليك ملئ جميع البيانات"),
                              ));
                            } else if (password.length < 6) {
                              _scaffoldKey.currentState.showSnackBar(SnackBar(
                                content: Text(
                                    "يجب عليك ادخال رقم سري اكبر من 6 ارقام"),
                              ));
                            } else {
                              await getLogin(email, password);
                              pref.loginState = true;

                              Navigator.pushReplacement(context, MaterialPageRoute(
                                  builder: (BuildContext context) {
                                return BottomNavigation();
                              }));
                            }
                          },
                          child: Container(
                            padding: EdgeInsets.only(top: 5, bottom: 5),
                            alignment: Alignment.center,
                            width: MediaQuery.of(context).size.width / 1.5,
                            decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                color: Colors.black,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0))),
                            child: Text(
                              'تسجيل الدخول ',
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Cairo",
                              ),
                            ),
                          ),
                        ),
//
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}



// ---------------- validation Notes ----------------------------------
// String validateEmail(value) {
//   String pattern =
//       r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
//   RegExp regExp = RegExp(pattern);

//   if (value.isEmpty) {
//     return 'يجب ادخال بريد الكترونى';
//   } else if (!regExp.hasMatch(value)) {
//     return 'يجب ادخال بريد الكترونى صحيح';
//   } else {
//     return null;
//   }
// }