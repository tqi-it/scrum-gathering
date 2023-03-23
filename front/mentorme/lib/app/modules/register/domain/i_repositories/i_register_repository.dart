import 'package:dartz/dartz.dart';
import 'package:mentorme/app/modules/register/domain/entities/register_response.dart';
import 'package:mentorme/app/modules/register/domain/params/register_params.dart';
import 'package:mentorme/app/shared/contracts/i_error.dart';

abstract class IRegisterRepository {
  Future<Either<IError, RegisterResponse>> call(RegisterParams params);
}
