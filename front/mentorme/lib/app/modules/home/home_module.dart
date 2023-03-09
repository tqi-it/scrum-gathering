import 'package:flutter_modular/flutter_modular.dart';
import 'package:mentorme/app/modules/home/domain/usecases/get_mentorme_usecase.dart';
import 'package:mentorme/app/modules/home/external/datasources/get_mentorme_datasource.dart';
import 'package:mentorme/app/modules/home/infra/repositories/get_mentorme_repository.dart';
import 'package:mentorme/app/modules/home/presenter/home_controller.dart';
import 'package:mentorme/app/modules/home/presenter/home_page.dart';
import 'package:mentorme/app/modules/home/presenter/home_store.dart';
import 'package:mentorme/app/modules/home/presenter/mentor_profile/mentor_profile_page.dart';


class HomeModule extends Module {
  @override
  List<Bind> get binds => [
    Bind((i) => HomeController(i(), i())),
    Bind((i) => HomeStore()),

    Bind((i) => GetMentorMeUsecase(i())),
    Bind((i) => GetMentorMeDatasource(i())),
    Bind((i) => GetMentorMeRepository(i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: (__, args) => const HomePage(),
      transition: TransitionType.rightToLeft,
    ),
    ChildRoute(
      '/mentor_profile_page',
      child: (__, args) => MentorProfilePage(mentorEntity: args.data['mentor'],),
      transition: TransitionType.rightToLeft,
    ),
  ];
}
