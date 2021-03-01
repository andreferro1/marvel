import 'package:marvel_vrsoft/app/modules/character/character_controller.dart';
import 'package:marvel_vrsoft/app/modules/comic/comic_controller.dart';
import 'package:marvel_vrsoft/app/modules/creator/creator_controller.dart';
import 'package:marvel_vrsoft/app/modules/creator/creator_module.dart';
import 'package:marvel_vrsoft/app/modules/login/login_controller.dart';
import 'package:marvel_vrsoft/app/modules/login/login_module.dart';

import 'app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:marvel_vrsoft/app/app_widget.dart';
import 'package:marvel_vrsoft/app/modules/home/home_module.dart';

import 'modules/character/character_module.dart';
import 'modules/home/home_module.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AppController()),
        Bind((i) => LoginController()),
        Bind((i) => CharacterController()),
        Bind((i) => ComicController()),
        Bind((i) => CreatorController())
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, module: LoginModule()),
        ModularRouter('/home', module: HomeModule()),
        ModularRouter('/character', module: CharacterModule()),
        ModularRouter('/comic', module: CharacterModule()),
        ModularRouter('/creator', module: CreatorModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
