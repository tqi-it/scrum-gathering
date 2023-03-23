import 'package:dartz/dartz.dart';
import 'package:mentorme/app/modules/register/domain/entities/register_response.dart';
import 'package:mentorme/app/modules/register/domain/i_repositories/i_register_repository.dart';
import 'package:mentorme/app/modules/register/domain/params/register_params.dart';
import 'package:mentorme/app/modules/register/infra/i_datasources/i_register_datasource.dart';
import 'package:mentorme/app/shared/contracts/i_error.dart';
import 'package:mentorme/app/shared/errors/datasource_error.dart';

class RegisterRepository extends IRegisterRepository {
  final IRegisterDatasource datasource;

  RegisterRepository(this.datasource);
  @override
  Future<Either<IError, RegisterResponse>> call(RegisterParams params) async {
    try {
      var result = await datasource(params);
      return Right(result);
    } on DataSourceError catch (e) {
      return Left(e);
    } catch (e, s) {
      return Left(DataSourceError(message: e.toString(), stackTrace: s));
    }
  }
}
