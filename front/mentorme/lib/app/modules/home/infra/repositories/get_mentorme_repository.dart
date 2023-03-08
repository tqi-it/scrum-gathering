import 'package:dartz/dartz.dart';
import 'package:mentorme/app/modules/home/domain/entities/get_mentorme_response.dart';
import 'package:mentorme/app/modules/home/domain/i_repositories/i_get_mentor_repository.dart';
import 'package:mentorme/app/modules/home/domain/params/get_mentor_params.dart';
import 'package:mentorme/app/modules/home/infra/i_datasources/i_mentorme_datasource.dart';
import 'package:mentorme/app/shared/contracts/i_error.dart';
import 'package:mentorme/app/shared/errors/datasource_error.dart';

class GetMentorMeRepository extends IGetMentorMeRepository {
  final IGetMentorMeDatasource datasource;

  GetMentorMeRepository(this.datasource);
  @override
  Future<Either<IError, GetMentorMeResponse>> call(GetMentorMeParams? params) async {
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
