import 'package:flutter/material.dart';
import 'package:mentorme/pages/page_base.dart';
import 'package:mentorme/app/shared/components/widget_appbar_home.dart';
import 'package:mentorme/app/shared/components/widget_bottom_navigation_bar_form.dart';
import 'package:mentorme/app/shared/components/widget_create_mentor_profile.dart';

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
