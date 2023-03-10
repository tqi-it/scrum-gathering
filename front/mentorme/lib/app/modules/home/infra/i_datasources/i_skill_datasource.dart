import 'package:mentorme/app/modules/home/domain/entities/skill_response.dart';

abstract class ISkillDatasource {
  Future<SkillResponse> call();
}