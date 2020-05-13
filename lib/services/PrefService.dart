import 'package:shared_preferences/shared_preferences.dart';

class PrefService {

  PrefService._();

  static final PrefService controller = PrefService._();

  SharedPreferences _preferences;

  initPref() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    _preferences = sharedPreferences;
  }

  //login state

  bool get loginState => _preferences.getBool("loginState") ?? false;

  set loginState(bool value) => _preferences.setBool("loginState", value);

  //user Token

  String get userToken => _preferences.getString("userToken") ?? "";

  set userToken(String value) => _preferences.setString("userToken", value);

  // logout state

  // bool get logOutState => _preferences.getBool('logOutState') ?? false;
  // set logOutStat(bool value) => _preferences.setBool("logOutState", value);
}
