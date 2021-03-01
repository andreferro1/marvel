import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../character_controller.dart';

AppBar characterAppBar() {
  final CharacterController controller = Modular.get<CharacterController>();

  return AppBar(
    leading: Observer(
      builder: (_) => controller.isSearching
          ? IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: controller.searchBack,
            )
          : Container(width: 0,),
    ),
    centerTitle: true,
    elevation: 0,
    title: Observer(
      builder: (_) => !controller.isSearching
          ? Image.asset(
              'lib/img/marvel_logo.png',
              height: 35,
              fit: BoxFit.cover,
            )
          : TextField(
              controller: controller.controller,
              onChanged: (value) => controller.searchChangeQuery(value),
              autofocus: true,
              cursorColor: Colors.white,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Search...',
                hintStyle: TextStyle(color: Colors.white),
                border: InputBorder.none,
              ),
            ),
    ),
    actions: <Widget>[
      Observer(
        builder: (_) => IconButton(
          icon: controller.isSearching ? Icon(Icons.close) : Icon(Icons.search),
          onPressed: controller.searchAcion,
        ),
      ),
    ],
  );
}
