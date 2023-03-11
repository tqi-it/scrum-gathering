import 'package:mentorme/app/core/domain/entities/contacts.dart';
import 'package:mentorme/app/modules/home/domain/entities/contact_history_entity.dart';
import 'package:mentorme/app/modules/home/domain/entities/skill_entity.dart';
import 'package:mentorme/app/modules/home/domain/params/contact_history_params.dart';
import 'package:mentorme/app/modules/home/domain/params/get_mentor_params.dart';
import 'package:mentorme/app/modules/home/domain/usecases/contact_history_usecase.dart';
import 'package:mentorme/app/modules/home/domain/usecases/get_mentorme_usecase.dart';
import 'package:mentorme/app/modules/home/domain/usecases/skill_usecase.dart';
import 'package:mentorme/app/modules/home/presenter/components/filter_skills_bottom_sheet.dart';
import 'package:mentorme/app/modules/home/presenter/home_store.dart';
import 'package:mentorme/app/shared/components/mentorme_alert.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mentorme/app/shared/utils/mentorme_states.dart';

class HomeController {
  final HomeStore store;
  final GetMentorMeUsecase _getMentorMeUsecase;
  final ContactHistoryUsecase _contactHistoryUsecase;
  final SkillUsecase _skillUsecase;

  HomeController(
    this.store,
    this._getMentorMeUsecase,
    this._contactHistoryUsecase,
    this._skillUsecase,
  );

  void initHome() {
    _doFetchSkillList();
    doFetchmentor();
  }

  void _doFetchSkillList() async {
    final response = await _skillUsecase();
    response.fold((error) {}, (response) {
      store.listSkills = response.skillEntity;
    });
  }

  void doFetchRegisterContact(Contacts contacts, int mentorId) async {
    final params = ContactHistoryParams(ContactHistoryEntity(
      contactType: contacts.type ?? "",
      mentor: true,
      personTo: mentorId,
      contactValue: contacts.url ?? "",
    ));
    final response = await _contactHistoryUsecase(params);
  }

  void doFetchmentor() async {
    store.homeState = MentorMeStates.loading;
    final params = GetMentorMeParams(skills: store.listSkillsSelected);
    final response = await _getMentorMeUsecase(params: params);

    response.fold(
      (error) {
        store.homeState = MentorMeStates.error;
        MentorMeAlerts.showInfo(
          title: 'Erro',
          description: 'Aguarde alguns instantes e tente novamente',
          buttons: [],
          alertHeight: 130,
        );
      },
      (response) {
        store.listMentors = response.mentorEntity;
        store.homeState = MentorMeStates.success;
      },
    );
  }

  void goToMentorProfile() {
    Modular.to.pushNamed(
      './mentor_profile_page',
    );
  }

  void openBottomsheetFilterskills() {
    FilterSkillsBottomSheet.show(
      title: 'Selecione habilidades',
      list: store.listSkills,
      onTap: (List<SkillEntity> list) {
        store.listSkillsSelected = list;
        doFetchmentor();
      },
    );
  }
}
