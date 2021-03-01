import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:marvel_vrsoft/app/shared/auth/auth_google_sigin.dart';
import 'package:marvel_vrsoft/app/shared/auth/biometrics_login.dart';
import 'package:marvel_vrsoft/app/shared/auth/shared_preferences.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'login_controller.g.dart';

@Injectable()
class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  BiometricsLogin _biometricsLogin = BiometricsLogin();
  AuthGoogleSigin _authGoogleSigin = AuthGoogleSigin();


  @observable
  User user;

  @observable
  TextEditingController emailController = TextEditingController();

  @observable
  TextEditingController passController = TextEditingController();

  @observable
  String errorMessage = '';

  @observable
  bool switchValue = false;

  @observable
  bool isBiometric = false;

  @observable
  bool loading = false;


  LoginController(){
    checkBiometric();
    checkShared();
  }

  @action
  Future<void> switchBiometric(value) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setBool(BIOMETRICS_KEY, value);
    switchValue = sp.getBool(BIOMETRICS_KEY);
    return null;
  }

  @action
  checkBiometric() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    isBiometric = await _biometricsLogin.isBiometricsAuth();
    switchValue = sp.getBool(BIOMETRICS_KEY);
    if (sp.getString(ACCESS_USER) != null) {
      emailController.text = sp.getString(ACCESS_USER);
    }
  }

  @action
  Future<bool> formValidator() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    if ((emailController.text.isEmpty || passController.text.isEmpty) &&
        sp.getBool(BIOMETRICS_KEY) == false) {
      errorMessage = 'username and password required';
      return false;
    }
    if (emailController.text.isEmpty && sp.getBool(BIOMETRICS_KEY) == false) {
      errorMessage = 'username and password required';
      return false;
    }
    errorMessage = '';
    if (sp.getBool(BIOMETRICS_KEY) ?? false) {
      getLoginBiometric();
    } else {
      handleLogin(emailController.text, passController.text);
    }
    return true;
  }

  void getLoginBiometric() async {
    loading = true;
    SharedPreferences sp = await SharedPreferences.getInstance();
    final String spPassword = sp.getString(ACCESS_PASSWORD);
    if (spPassword == null) {
      loading = false;
      errorMessage = 'password is required for the first login!';
    } else {
      if (await _biometricsLogin.isBiometricsAuth()) {
        try {
          if (await _biometricsLogin.auth()) {
            handleLogin(emailController.text, spPassword);
          }
        } on PlatformException catch (e) {
          loading = false;
          print(e.toString());
          errorMessage = 'biometrics not registered on this device!';
        } catch (e) {
          loading = false;
          errorMessage = 'biometrics error, access with password!';
        }
      }
    }
    loading = false;
  }

  void handleLogin(String user, String pass) async{
    loading = true;
    SharedPreferences sp = await SharedPreferences.getInstance();
    if(user == 'marvelvr@gmail.com' && pass == 'marvel'){
      sp.setString(ACCESS_USER, user);
      sp.setString(ACCESS_PASSWORD, pass);
      Modular.navigator.pushNamed('/home');
      errorMessage = '';
      return;
    }
    loading = false;
    errorMessage = 'incorrect username and/or password';
    return;
  }

void checkShared() async {
  SharedPreferences sp = await SharedPreferences.getInstance();
  if (sp.getBool(BIOMETRICS_KEY) == null) {
    sp.setBool(BIOMETRICS_KEY, false);
  }
}

  void loginWithGoogle() async {
    loading = true;
    try {
      user = await _authGoogleSigin.getGoogleLogin();
      Modular.navigator.pushNamed('/home');
    }catch (e){
      errorMessage = 'Error with google login';
    }
    loading = false;
  }


}
