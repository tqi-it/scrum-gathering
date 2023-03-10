import 'package:mentorme/app/core/domain/entities/contacts.dart';
import 'package:mentorme/app/core/domain/entities/mentor_entity.dart';
import 'package:mentorme/app/modules/home/domain/entities/get_mentorme_response.dart';
import 'package:mentorme/app/modules/home/domain/entities/skill_entity.dart';
import 'package:mentorme/app/modules/home/domain/entities/skill_response.dart';
import 'package:mentorme/app/shared/theme/images.dart';
import 'package:mentorme/app/shared/utils/enums.dart';

class SkillMapper {
  static SkillResponse fromJson(List<dynamic> list) {
    List<SkillEntity> getSkill(List<dynamic> list) {
      final List<SkillEntity> listSkills = [];
      for (var element in list) {
        listSkills.add(
          SkillEntity(
            id: element['id'],
            name: element['name'],
            description: element['description'],
          ),
        );
      }

      return listSkills;
    }

    return SkillResponse(getSkill(list));
  }
}
