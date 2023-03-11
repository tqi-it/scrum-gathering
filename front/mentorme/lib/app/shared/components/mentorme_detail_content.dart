import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mentorme/app/core/domain/entities/mentor_entity.dart';
import 'package:mentorme/app/shared/components/mentor_me_button.dart';
import 'package:mentorme/app/shared/components/widget_mentor_card.dart';
import 'package:mentorme/app/shared/theme/dimens.dart';

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
                    "Posso mentorar em:",
                    style: TextStyle(fontSize: 15, color: Color(0xFF535353), fontWeight: FontWeight.w700),
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
                                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                      margin: EdgeInsets.only(right: mentor.skills.last == skill ? 0 : 15),
                                      decoration:
                                          BoxDecoration(color: Colors.pink, borderRadius: BorderRadius.circular(20)),
                                      child: Text(
                                        skill,
                                        style: const TextStyle(
                                            fontSize: 12, fontWeight: FontWeight.w700, color: Colors.white),
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
                    style: TextStyle(fontSize: 15, color: Color(0xFF535353), fontWeight: FontWeight.w700),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      mentor.description,
                      style: const TextStyle(fontSize: 15, color: Color(0xFF535353), fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: ThemeDimens.smallSpace),
              const Text(
                "Fale comigo:",
                style: TextStyle(
                  fontSize: 15,
                  color: Color(0xFF535353),
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: ThemeDimens.smallSpace),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: mentor.contacts
                    .map(
                      (element) => Flexible(
                        child: Container(
                          height: 50,
                          margin: EdgeInsets.only(
                            right: element == mentor.contacts.last ? 0 : ThemeDimens.smallSpace,
                          ),
                          child: MentorMeButton(
                            textStyle: const TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                              fontSize: 16,
                            ),
                            radius: 6,
                            label: element.type ?? '',
                            icon: element.icon,
                            onPressed: () {
                              final controller = Modular.get<HomeController>();
                              controller.doFetchRegisterContact(element, mentor.id);
                              openUrl(element.url ?? '');
                            },
                            isActive: true,
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ],
      ),
    );
  }
}
