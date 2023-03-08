import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rx_notifier/rx_notifier.dart';
import 'package:mentorme/app/modules/home/presenter/home_controller.dart';
import 'package:mentorme/app/shared/components/widget_mentor_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = Modular.get<HomeController>();

  @override
  void initState() {
    controller.doFetchmentor();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RxBuilder(
      builder: (_){
        return Scaffold(
          appBar: AppBar(
            title: Text('Mentorme'),
            centerTitle: true,
            flexibleSpace: Container(
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
            ),
          ),
          body: Container(
              color: Color(0xFFEBF0FF),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: controller.store.listMentors.map((e) => MentorCardWidget(mentor: e,)).toList(),
                ),
              )
          ),
        );
      },
    );
  }
}
