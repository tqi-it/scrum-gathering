import 'package:mentorme/app/core/domain/entities/mentor_entity.dart';
import 'package:mentorme/app/modules/home/domain/entities/skill_entity.dart';
import 'package:mentorme/app/shared/utils/mentorme_states.dart';
import 'package:rx_notifier/rx_notifier.dart';

class HomeStore{
  final _homeState = RxNotifier<MentorMeStates>(MentorMeStates.loading);
  MentorMeStates get homeState => _homeState.value;
  set homeState(MentorMeStates value) => _homeState.value = value;

  final _listMentors = RxNotifier<List<MentorEntity>>([]);
  List<MentorEntity> get listMentors => _listMentors.value;
  set listMentors(List<MentorEntity> value) => _listMentors.value = value;

  final _listSkills = RxNotifier<List<SkillEntity>>([]);
  List<SkillEntity> get listSkills => _listSkills.value;
  set listSkills(List<SkillEntity> value) => _listSkills.value = value;

  final _listSkillsSelected = RxNotifier<List<SkillEntity>>([]);
  List<SkillEntity> get listSkillsSelected => _listSkillsSelected.value;
  set listSkillsSelected(List<SkillEntity> value) => _listSkillsSelected.value = value;
}