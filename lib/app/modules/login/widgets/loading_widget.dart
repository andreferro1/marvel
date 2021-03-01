import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_vrsoft/app/modules/login/login_controller.dart';
import 'package:marvel_vrsoft/app/shared/constants/styles.dart';

class LoadingWidget extends StatefulWidget {

  @override
  _LoadingWidgetState createState() => _LoadingWidgetState();
}

class _LoadingWidgetState extends ModularState<LoadingWidget, LoginController> {
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_){
      return Visibility(
          visible: controller.loading,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'Carregando...',
                      style: TextStyle(color: PRIMARY_COLOR),
                    )
                  ],
                ),
              ),
            ],
          ));
    });
  }
}
