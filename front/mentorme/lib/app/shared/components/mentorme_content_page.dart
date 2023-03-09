import 'package:flutter/material.dart';

class MentorMeContentPage extends StatelessWidget {
  final Widget child;
  const MentorMeContentPage({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Mentorme'),
          centerTitle: true,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color.fromARGB(204, 10, 125, 184), Color.fromARGB(204, 0, 40, 60)],
              ),
            ),
          ),
        ),
        body: child
    );
  }
}
