import 'package:flutter_modular/flutter_modular.dart';
import 'package:mentorme/app/modules/register/domain/entities/register_entity.dart';
import 'package:mentorme/app/modules/register/domain/params/register_params.dart';
import 'package:mentorme/app/modules/register/domain/usecases/contact_history_usecase.dart';
import 'package:mentorme/app/shared/services/http_service/http_service.dart';
import 'package:mentorme/app/shared/storage/i_custom_app_storage.dart';

class RegisterController {
  final RegisterUsecase _registerUsecase;

  RegisterController(this._registerUsecase);
  void doRegisterMentor(RegisterEntity register) async {
    final params = RegisterParams(register);
    final response = await _registerUsecase(params);
  }
}
