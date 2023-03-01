import 'package:flutter/material.dart';
import 'package:my_app/widgets/widget_bottom_navigation_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
      bottomNavigationBar: const BottomNavigationBarWidget(),
    );
  }
}
