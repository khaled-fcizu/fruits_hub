import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fruit_hub/core/di/dependancy_injection.dart';
import 'package:fruit_hub/core/service/shared_prefrance_sigleton.dart';
import 'package:fruit_hub/firebase_options.dart';
import 'package:fruit_hub/fruit_hub.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupGetIt();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await SharedPrefranceSigleton.init();
  runApp(const FruitHub());
}
