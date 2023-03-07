import 'package:flutter/material.dart';
import 'package:my_app/pages/page_base.dart';
import 'package:my_app/widgets/widget_bottom_navigation_bar.dart';

import '../widgets/widget_appbar_home.dart';
import '../widgets/widget_mentor_slide.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.title});

  final String title;

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
