import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mentorme/app/shared/components/mentorme_air_spin_ring.dart';
import 'package:mentorme/app/shared/theme/theme_colors.dart';
import 'package:mentorme/app/shared/utils/mentorme_states.dart';
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
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Mentorme'),
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
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  color: const Color(0xFFEBF0FF),
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Visibility(
                      visible: controller.store.homeState == MentorMeStates.loading,
                      replacement: Column(
                        children: controller.store.listMentors
                            .map((e) => MentorCardWidget(
                          mentor: e,
                        ))
                            .toList(),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: (MediaQuery.of(context).size.height/2)-60,),
                          MentorMeSpinRing(
                            color: Colors.pink,
                            lineWidth: 3,
                            size: 50,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        );
      },
    );
  }
}
