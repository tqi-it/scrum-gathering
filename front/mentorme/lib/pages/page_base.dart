import 'package:flutter/material.dart';

class BasePage extends StatelessWidget {
  const BasePage(
      {super.key,
      required this.appBarWidget,
      required this.bodyWidget,
      required this.bottomNavigationBarWidget});

  final PreferredSizeWidget appBarWidget;
  final Widget bodyWidget;
  final Widget bottomNavigationBarWidget;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: appBarWidget,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(204, 10, 125, 184),
              Color.fromARGB(204, 0, 40, 60)
            ],
          ),
        ),
        child: bodyWidget,
      ),
      bottomNavigationBar: bottomNavigationBarWidget,
    );
  }
}
