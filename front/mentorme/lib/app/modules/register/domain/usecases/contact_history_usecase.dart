import 'package:dartz/dartz.dart';
import 'package:mentorme/app/modules/register/domain/entities/register_response.dart';
import 'package:mentorme/app/modules/register/domain/i_repositories/i_register_repository.dart';
import 'package:mentorme/app/modules/register/domain/params/register_params.dart';
import 'package:mentorme/app/shared/contracts/i_error.dart';

abstract class IRegisterUsecase {
  Future<Either<IError, RegisterResponse>> call(RegisterParams params);
}

class RegisterUsecase extends IRegisterUsecase {
  final IRegisterRepository repository;

  RegisterUsecase(this.repository);
  @override
  Future<Either<IError, RegisterResponse>> call(RegisterParams params) async {
    final result = await repository(params);
    return result;
  }
}
