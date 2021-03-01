import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:marvel_vrsoft/app/app_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ModularApp(module: AppModule()));

}
