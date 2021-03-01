import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_vrsoft/app/shared/constants/styles.dart';

import '../login_controller.dart';
class AcessarBiometriaWidget extends StatefulWidget {
  @override
  _AcessarBiometriaWidgetState createState() => _AcessarBiometriaWidgetState();
}

class _AcessarBiometriaWidgetState extends ModularState<AcessarBiometriaWidget, LoginController> {
  @override
  // TODO: implement controller
  LoginController get controller => super.controller;
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_){
      return Visibility(
        visible: controller.isBiometric,
        child: Row(
          children: [
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Text(
                'Acessar com biometria',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
            Observer(
              builder: (BuildContext context) {
                return Align(
                  alignment: Alignment.bottomRight,
                  child: Switch(
                    activeColor: Colors.white,
                    activeTrackColor: PRIMARY_COLOR,
                    onChanged: (value) => controller.switchBiometric(value),
                    value: controller.switchValue ?? false,
                  ),
                );
              },
            ),
          ],
        ),
      );
    });
  }
}
