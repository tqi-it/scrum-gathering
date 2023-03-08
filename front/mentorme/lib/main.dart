import 'package:flutter/material.dart';
import 'package:mentorme/app/modules/app_module.dart';
import 'package:mentorme/app/modules/app_widget.dart';
import 'package:mentorme/app/shared/services/firebase_service.dart';
import 'package:flutter_modular/flutter_modular.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FirebaseService.init();
  return runApp(
    ModularApp(
      module: AppModule(),
      child: AppWidget(),
    ),
  );
}