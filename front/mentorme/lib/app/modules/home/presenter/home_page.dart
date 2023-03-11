import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mentorme/app/shared/components/mentorme_air_spin_ring.dart';
import 'package:mentorme/app/shared/components/mentorme_content_page.dart';
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
    controller.initHome();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RxBuilder(
      builder: (_) {
        return MentorMeContentPage(
          pageName: 'Mentorize',
          child: Column(
            children: [
              Expanded(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  color: ThemeColors.backgroundColour,
                  child: Visibility(
                    visible: controller.store.homeState == MentorMeStates.loading,
                    replacement: RefreshIndicator(
                        onRefresh: () async {
                          controller.doFetchmentor();
                        },
                        child: SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          child: Column(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(right: 15, left: 15),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        controller.openBottomsheetFilterskills();
                                      },
                                      child: Row(
                                        children: [
                                          const Text(
                                            'Filtrar',
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w400,
                                              color: Color(0XFF0497E3),
                                            ),
                                          ),
                                          const Icon(
                                            Icons.keyboard_arrow_down_outlined,
                                            color: Color(0XFF0497E3),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              controller.store.listMentors.isEmpty
                                  ? Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Nenhum mentor encontrado!',
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w400,
                                            color: Color(0XFF0497E3),
                                          ),
                                        ),
                                      ],
                                    )
                                  : Column(
                                      children: controller.store.listMentors
                                          .map(
                                            (e) => Container(
                                              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                                              child: MentorCardWidget(
                                                mentor: e,
                                              ),
                                            ),
                                          )
                                          .toList(),
                                    ),
                            ],
                          ),
                        )),
                    child: const MentorMeSpinRing(
                      color: Colors.pink,
                      lineWidth: 3,
                      size: 50,
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
