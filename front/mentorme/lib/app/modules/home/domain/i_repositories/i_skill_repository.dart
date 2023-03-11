import 'package:dartz/dartz.dart';
import 'package:mentorme/app/modules/home/domain/entities/skill_response.dart';
import 'package:mentorme/app/shared/contracts/i_error.dart';

abstract class ISkillRepository {
  Future<Either<IError, SkillResponse>> call();
}
