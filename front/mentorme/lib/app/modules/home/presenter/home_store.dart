import 'package:mentorme/app/core/domain/entities/mentor_entity.dart';
import 'package:mentorme/app/shared/utils/mentorme_states.dart';
import 'package:rx_notifier/rx_notifier.dart';

class HomeStore{
  final _homeState = RxNotifier<MentorMeStates>(MentorMeStates.loading);
  MentorMeStates get homeState => _homeState.value;
  set homeState(MentorMeStates value) => _homeState.value = value;

  final _listMentors = RxNotifier<List<MentorEntity>>([]);
  List<MentorEntity> get listMentors => _listMentors.value;
  set listMentors(List<MentorEntity> value) => _listMentors.value = value;
}