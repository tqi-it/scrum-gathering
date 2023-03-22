import 'package:flutter_modular/flutter_modular.dart';
import 'package:mentorme/app/modules/home/home_module.dart';
import 'package:mentorme/app/modules/register/presenter/register_page.dart';
import 'package:mentorme/app/modules/register/register_controller.dart';

class RegisterModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((i) => RegisterController(i(), i())),
      ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: (__, args) => const RegisterPage(),
      transition: TransitionType.rightToLeft,
    ),
  ];
}
