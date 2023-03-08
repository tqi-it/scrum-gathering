import 'package:flutter_modular/flutter_modular.dart';
import 'package:mentorme/app/modules/login/login_module.dart';
import 'package:mentorme/app/shared/services/http_service/http_service.dart';
import 'package:mentorme/app/shared/storage/secure_app_storage.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [

    Bind((i) => HttpService()),
    Bind((i) => SecureAppStorage()),
  ];

  @override
  List<ModularRoute> get routes => [
    ModuleRoute('/', module: LoginModule()),
  ];
}
