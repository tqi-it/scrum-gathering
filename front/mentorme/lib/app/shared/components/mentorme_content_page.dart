import 'package:flutter/material.dart';

class MentorMeContentPage extends StatelessWidget {
  final Widget child;
  final String pageName;
  final Widget? appBar;

  const MentorMeContentPage(
      {Key? key, required this.child, required this.pageName, this.appBar})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar == null
          ? AppBar(
              title: Text(pageName),
              centerTitle: true,
              backgroundColor: const Color(0xFF0A7DB8),
              elevation: 0,
              // flexibleSpace: Container(
              //   decoration: const BoxDecoration(
              //     gradient: LinearGradient(
              //       begin: Alignment.topCenter,
              //       end: Alignment.bottomCenter,
              //       colors: [Color.fromARGB(204, 10, 125, 184), Color.fromARGB(204, 0, 40, 60)],
              //     ),
              //   ),
              // ),
            )
          : null,
      body: Column(
        children: [
          appBar != null ? appBar! : Container(),
          Expanded(
            child: Column(
              children: [Expanded(child: child)],
            ),
          ),
        ],
      ),
    );
  }
}
