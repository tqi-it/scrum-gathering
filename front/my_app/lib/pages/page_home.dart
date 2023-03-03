import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:my_app/widgets/widget_bottom_navigation_bar.dart';

import '../widgets/widget_appbar_home.dart';
import '../widgets/widget_mentor_slide.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const AppBarHomeWidget(
        title: "Mentorme",
      ),
      body: MentorSlideWidget(),
      bottomNavigationBar: const BottomNavigationBarWidget(),
    );
  }
}
