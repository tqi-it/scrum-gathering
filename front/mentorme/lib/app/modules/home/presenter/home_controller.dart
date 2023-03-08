import 'package:mentorme/app/modules/home/domain/usecases/get_mentorme_usecase.dart';
import 'package:mentorme/app/modules/home/presenter/home_store.dart';
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
      },
      (response){
        store.listMentors = response.mentorEntity;
        store.homeState = MentorMeStates.success;
      },
    );
  }
}
