import 'package:flutter/material.dart';
import 'package:my_app/pages/page_base.dart';

import '../widgets/widget_appbar_home.dart';
import '../widgets/widget_bottom_navigation_bar_form.dart';
import '../widgets/widget_create_mentor_profile.dart';

class CreateProfileMentorPage extends StatelessWidget {
  const CreateProfileMentorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BasePage(
        appBarWidget: const AppBarHomeWidget(
          title: "Criar Perfil",
        ),
        bodyWidget: CreateMentorProfileWidget(),
        bottomNavigationBarWidget: const BottomNavigationBarFormWidget(
          title: "Finalizar e iniciar",
        ));
  }
}
