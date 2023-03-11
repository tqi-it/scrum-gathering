import 'package:dartz/dartz.dart';
import 'package:mentorme/app/modules/home/domain/entities/skill_response.dart';
import 'package:mentorme/app/modules/home/domain/i_repositories/i_skill_repository.dart';
import 'package:mentorme/app/shared/contracts/i_error.dart';


abstract class ISkillUsecase {
  Future<Either<IError, SkillResponse>> call();
}

class SkillUsecase extends ISkillUsecase {
  final ISkillRepository repository;

  SkillUsecase(this.repository);
  @override
  Future<Either<IError, SkillResponse>> call() async {

    final result = await repository();
    return result;
  }
}
