import 'package:mentorme/app/modules/register/domain/entities/register_response.dart';
import 'package:mentorme/app/modules/register/domain/params/register_params.dart';

abstract class IRegisterDatasource {
  Future<RegisterResponse> call(RegisterParams params);
}
