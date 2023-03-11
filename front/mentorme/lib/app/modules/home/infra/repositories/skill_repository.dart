import 'package:dartz/dartz.dart';
import 'package:mentorme/app/modules/home/domain/entities/skill_response.dart';
import 'package:mentorme/app/modules/home/domain/i_repositories/i_skill_repository.dart';
import 'package:mentorme/app/modules/home/infra/i_datasources/i_skill_datasource.dart';
import 'package:mentorme/app/shared/contracts/i_error.dart';
import 'package:mentorme/app/shared/errors/datasource_error.dart';

class SkillRepository extends ISkillRepository {
  final ISkillDatasource datasource;

  SkillRepository(this.datasource);
  @override
  Future<Either<IError, SkillResponse>> call() async {
    try {
      var result = await datasource();
      return Right(result);
    } on DataSourceError catch (e) {
      return Left(e);
    } catch (e, s) {
      return Left(DataSourceError(message: e.toString(), stackTrace: s));
    }
  }
}
