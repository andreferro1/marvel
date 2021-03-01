import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:marvel_vrsoft/app/modules/login/widgets/acessar_biometria_widget.dart';
import 'package:marvel_vrsoft/app/modules/login/widgets/avatar_login_widget.dart';
import 'package:marvel_vrsoft/app/modules/login/widgets/text_field_login_widget.dart';
import 'package:marvel_vrsoft/app/shared/constants/styles.dart';
import 'file:///C:/src/marvel_vrsoft/lib/app/modules/login/widgets/error_message_widget.dart';
import 'file:///C:/src/marvel_vrsoft/lib/app/modules/login/widgets/loading_widget.dart';
import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  final String title;

  const LoginPage({Key key, this.title = "Login"}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginController> {
  @override
  LoginController get controller => super.controller;

  @override
  void initState() {
    super.initState();
    controller.checkBiometric();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SECOND_COLOR,
      appBar: AppBar(
        backgroundColor: SECOND_COLOR,
      ),
      body: SingleChildScrollView(
          padding: EdgeInsets.only(left: 16.0, right: 16.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            AvatarLoginWidget(),
            ErrorMessageWidget(),
            Column(
              children: [
                LoadingWidget(),
                TextFieldLoginWidget(
                  controller: controller.emailController,
                  hintText: 'Email',
                ),
                Observer(
                  builder: (BuildContext context) {
                    return Visibility(
                      visible: controller.switchValue == true ? false : true,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 25),
                        child: TextFieldLoginWidget(
                          hintText: 'Senha',
                          obscureText: true,
                          controller: controller.passController,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 25.0),
              child: Container(
                  child: RaisedButton(
                child: Container(
                  height: 43,
                  child: Center(
                    child: Text(
                      'ENTRAR',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                color: PRIMARY_COLOR,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                onPressed: () {
                  controller.formValidator();
                },
              )),
            ),
            AcessarBiometriaWidget(),
            Padding(
              padding: EdgeInsets.only(top: 100.0),
              child: GestureDetector(
                child: Container(
                  height: 43,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                    Icon(FontAwesomeIcons.google, color: PRIMARY_COLOR,),
                    SizedBox(
                      width: 10,
                    ),
                    Text('Login com google',
                        style: TextStyle(color: Colors.white)),
                  ]),
                ),
                onTap: controller.loginWithGoogle,
              ),
            ),
          ])),
    );
  }
}
