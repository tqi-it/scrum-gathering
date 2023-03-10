import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mentorme/app/core/domain/entities/mentor_entity.dart';
import 'package:mentorme/app/shared/components/mentor_me_button.dart';
import 'package:mentorme/app/shared/components/widget_mentor_card.dart';

import '../../modules/home/presenter/home_controller.dart';
import 'mentorme_alert.dart';

class MentorDetailContent extends StatelessWidget {
  final MentorEntity mentor;

  const MentorDetailContent({super.key, required this.mentor});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(15, 10, 15, 15),
      width: double.infinity,
      height: double.infinity,
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Habilidades",
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          child: Row(
                            children: mentor.skills
                                .map((skill) => Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 12, vertical: 6),
                                      margin: EdgeInsets.only(
                                          right: mentor.skills.last == skill
                                              ? 0
                                              : 15),
                                      decoration: BoxDecoration(
                                          color: Colors.pink,
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Text(
                                        skill,
                                        style: const TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.white),
                                      ),
                                    ))
                                .toList(),
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Sobre mim:",
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.w700),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      mentor.description,
                      style: const TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10,),
          SizedBox(
              width: double.infinity,
              height: 50,
              child: MentorMeButton(
                onPressed: () {
                  final controller = Modular.get<HomeController>();

                  List<MentorMeButton> buttons = [];

                  for (var element in mentor.contacts) {
                    buttons.add(
                      MentorMeButton(
                        label: element.type ?? '',
                        icon: element.icon,
                        onPressed: () {
                          controller.doFetchRegisterContact(element, mentor.id);
                          openUrl(element.url ?? '');
                        },
                        isActive: true,
                      ),
                    );
                  }

                  MentorMeAlerts.showInfo(
                    title: 'Agende sua mentoria',
                    description: 'Oi! Vamos trocar ideias sobre como posso ajudar no seu desenvolvimento pessoal e profissional.',
                    buttons: buttons,
                  );
                },
                label: "Fale comigo",
                isActive: true,
                radius: 6,
              )),
        ],
      ),
    );
  }
}
