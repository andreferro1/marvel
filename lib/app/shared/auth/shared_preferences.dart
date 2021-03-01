import 'package:shared_preferences/shared_preferences.dart';

const BIOMETRICS_KEY = 'BIOMETRICS_KEY';
const ACCESS_USER = 'ACCESS_USER';
const ACCESS_ID_USER = 'ACCESS_ID_USER';
const ACCESS_PASSWORD = 'ACCESS_PASSWORD';

class SP {
  static Future<String> getUser() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.getString(ACCESS_USER);
  }

  static Future<String> getIdUser() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.getString(ACCESS_ID_USER);
  }

  static Future<String> getPassword() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.getString(ACCESS_PASSWORD);
  }

  static Future<bool> getBiometricsKey() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.getBool(BIOMETRICS_KEY);
  }
}
