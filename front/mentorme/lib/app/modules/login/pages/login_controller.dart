import 'package:flutter_modular/flutter_modular.dart';
import 'package:mentorme/app/shared/services/http_service/http_service.dart';
import 'package:mentorme/app/shared/storage/i_custom_app_storage.dart';

class LoginController {
  final HttpService _httpService;
  final ICustomAppStorage _storage;

  LoginController(this._httpService, this._storage);

  void checkLoggedStatus() {
    _storage.readKey('jwtToken').then(
      (value) {
        final jwtToken = value.toString();
        if (jwtToken.isEmpty) {
          _goToLogin();
        } else {
          _httpService.setAuthorization(jwtToken);
          goToHome();
        }
      },
    );
  }

  _goToLogin() {
    //goToHome();
    goToRegister();
  }

  goToRegister() async {
    await Future.delayed(
      const Duration(milliseconds: 500),
      () {
        Modular.to.pushReplacementNamed(
          '/register/',
          forRoot: true,
          arguments: {
            'wasLoginNow': false,
          },
        );
      },
    );
  }

  goToHome() async {
    await Future.delayed(
      const Duration(milliseconds: 500),
      () {
        Modular.to.pushReplacementNamed(
          '/home/',
          forRoot: true,
          arguments: {
            'wasLoginNow': false,
          },
        );
      },
    );
  }
}
