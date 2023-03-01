import 'package:flutter/material.dart';
import 'package:my_app/widgets/widget_bottom_navigation_bar.dart';
import 'package:my_app/widgets/widget_appbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(title: "Mentorme", factor: 2),
      body: Container(),
      bottomNavigationBar: const BottomNavigationBarWidget(),
    );
  }
}
