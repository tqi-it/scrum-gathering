import 'package:flutter_modular/flutter_modular.dart';
import 'package:mentorme/app/modules/register/domain/usecases/contact_history_usecase.dart';
import 'package:mentorme/app/modules/register/external/datasources/register_datasource.dart';
import 'package:mentorme/app/modules/register/infra/repositories/register_repository.dart';
import 'package:mentorme/app/modules/register/presenter/register_page.dart';
import 'package:mentorme/app/modules/register/presenter/register_controller.dart';

class RegisterModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((i) => RegisterController(i())),
        Bind((i) => RegisterUsecase(i())),
        Bind((i) => RegisterDatasource(i())),
        Bind((i) => RegisterRepository(i())),
      ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: (__, args) => RegisterPage(),
      transition: TransitionType.rightToLeft,
    ),
  ];
}
