import 'package:mentorme/app/modules/home/domain/entities/skill_entity.dart';

class GetMentorMeParams {
  final List<SkillEntity>? skills;

  GetMentorMeParams({
    required this.skills,
  });

  List toBodyRequest() {
    List<Map<String, dynamic>> skillsIds = [];

    for (var element in skills!) {
      skillsIds.add(
        {
          'id': element.id,
        },
      );
    }

    return skillsIds;
  }
}
