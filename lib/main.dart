

import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/shared_prefrance_sigleton.dart';
import 'package:fruit_hub/fruit_hub.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefranceSigleton.init();
  runApp(const FruitHub());
}

