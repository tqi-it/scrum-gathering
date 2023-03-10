import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mentorme/app/core/domain/entities/mentor_entity.dart';
import 'package:mentorme/app/shared/components/mentor_me_button.dart';

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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Habilidades",
            style: TextStyle(
                fontSize: 15, color: Colors.black, fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            children: [
              Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                child: Row(
                  children: mentor.skills
                      .map((skill) =>
                          MentorMeButton(label: skill, isActive: true))
                      .toList(),
                ),
              ))
            ],
          ),
          const Text(
            "Sobre mim:",
            style: TextStyle(
                fontSize: 15, color: Colors.black, fontWeight: FontWeight.w700),
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
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: MentorMeButton(
                    onPressed: () {},
                    label: "Fale comigo",
                    isActive: true,
                    radius: 6,
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
