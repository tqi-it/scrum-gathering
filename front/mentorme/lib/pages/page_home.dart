import 'package:flutter/material.dart';
import 'package:mentorme/pages/page_base.dart';
import 'package:mentorme/app/shared/components/widget_appbar_home.dart';
import 'package:mentorme/app/shared/components/widget_bottom_navigation_bar.dart';
import 'package:mentorme/app/shared/components/widget_mentor_slide.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key,});

  @override
  Widget build(BuildContext context) {
    return BasePage(
      appBarWidget: const AppBarHomeWidget(
        title: "Criar Perfil",
      ),
      bodyWidget: MentorSlideWidget(),
      bottomNavigationBarWidget: const BottomNavigationBarWidget(),
    );
  }
}
