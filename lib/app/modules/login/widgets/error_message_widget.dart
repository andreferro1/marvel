import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:marvel_vrsoft/app/modules/login/login_controller.dart';

class ErrorMessageWidget extends StatefulWidget {

  @override
  _ErrorMessageWidgetState createState() => _ErrorMessageWidgetState();
}

class _ErrorMessageWidgetState extends ModularState<ErrorMessageWidget, LoginController> {
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_){
        return Visibility(
          visible: controller.errorMessage != '' ? true : false,
          child: Padding(
            padding: EdgeInsets.only(bottom: 16.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      FontAwesomeIcons.frown,
                      size: 17,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 8.0,
                    ),
                    Text(
                      'Oops!',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(
                  height: 7.0,
                ),
                Text(
                  controller.errorMessage,
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
