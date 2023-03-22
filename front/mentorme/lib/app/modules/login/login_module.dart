import 'package:flutter_modular/flutter_modular.dart';
import 'package:mentorme/app/modules/home/home_module.dart';
import 'package:mentorme/app/modules/login/pages/login_controller.dart';
import 'package:mentorme/app/modules/login/pages/login_page.dart';
import 'package:mentorme/app/modules/login/pages/onboarding_page.dart';
import 'package:mentorme/app/modules/register/presenter/register_page.dart';
import 'package:mentorme/app/modules/register/register_module.dart';

class LoginModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((i) => LoginController(i(), i())),
      ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: (__, args) => const LoginPage(),
      transition: TransitionType.rightToLeft,
    ),
    ChildRoute(
      '/onboarding',
      child: (__, args) => const RegisterPage(),
      transition: TransitionType.rightToLeft,
    ),
    ModuleRoute('/home', module: HomeModule()),
    ModuleRoute('/register', module: RegisterModule()),
  ];
}
