import 'package:flutter_modular/flutter_modular.dart';
import 'package:mentorme/app/shared/services/http_service/http_service.dart';
import 'package:mentorme/app/shared/storage/i_custom_app_storage.dart';

class RegisterController {
  final HttpService _httpService;
  final ICustomAppStorage _storage;

  RegisterController(this._httpService, this._storage);
}
