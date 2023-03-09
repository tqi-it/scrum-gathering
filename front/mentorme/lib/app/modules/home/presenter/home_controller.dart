import 'package:mentorme/app/modules/home/domain/usecases/get_mentorme_usecase.dart';
import 'package:mentorme/app/modules/home/presenter/home_store.dart';
import 'package:mentorme/app/shared/components/mentorme_alert.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mentorme/app/shared/utils/mentorme_states.dart';

class HomeController {
  final HomeStore store;
  final GetMentorMeUsecase _getMentorMeUsecase;

  HomeController(this.store, this._getMentorMeUsecase);


  void doFetchmentor()async{
    store.homeState = MentorMeStates.loading;
    final response = await _getMentorMeUsecase();

    response.fold(
      (error){
        store.homeState = MentorMeStates.error;
        MentorMeAlerts.showInfo(
          title: 'Erro',
          description: 'Aguarde alguns instantes e tente novamente',
          buttons: [],
          alertHeight: 130,
        );
      },
      (response){
        store.listMentors = response.mentorEntity;
        store.homeState = MentorMeStates.success;
      },
    );
  }

  void goToMentorProfile(){
    Modular.to.pushNamed(
      './mentor_profile_page',
    );
  }
}
