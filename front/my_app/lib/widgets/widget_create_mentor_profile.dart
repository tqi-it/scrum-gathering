import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:my_app/widgets/widget_featured_profile.dart';
import 'package:my_app/widgets/widget_mentor_card.dart';

import '../entity/entity_mentor.dart';

class CreateMentorProfileWidget extends StatelessWidget {
  CreateMentorProfileWidget({super.key});

  final MentorEntity mentor = MentorEntity(
      name: "Beltrano Gomes Pereira",
      skill: "Agilidade",
      profile: "#",
      imageProfile:
          "https://s3-alpha-sig.figma.com/img/2714/6c52/9b73f122051d33a591bb28d724f80cd8?Expires=1678665600&Signature=R3ME5R90uBWzt0CtS6I1hs8Lc6U0wpHLnWk0bl15HTmQNEpAUkryX3csozuedizDrYf8gwYqHzt9z3CTE~FK3q4q-5w-7XEVu6OfpIIjNPTb6huEqmnRXYCDwobJB4ZoRSeDb1gKcqJb0Xw0JHmjjtrjOAuIhEPWnW5Z1QZ0kI0g1DhtQCdGhD3YfbyzEi3fqsu3GWIOE2tNpFhTLsu4HpJSvTOAoPZ0qkpyOl3O0X~2CIz6s775nuGuQbnfs7hqOSWYOXRmCz2-IfCb25Rw-18eNkjxif7s8uvPFcaJ3Bv6P38heTcExEgKnLqmT6LhKcCIQFr9lbQ7c6ivBjlfwA__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4",
      availability: "Manhã, tarde e noite",
      slots: 1,
      likes: 999,
      rate: 4.9);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(15, 50, 15, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(mentor.imageProfile),
                radius: 50,
              ),
              const SizedBox(height: 8),
              const Text(
                "Alterar foto do perfil",
                style: TextStyle(color: Color(0xFF00F0FF), fontSize: 12),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          color: const Color(0xFFEBF0FF),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Quero ser:",
                style: TextStyle(
                    color: Color(0xFF535353),
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style:
                        ElevatedButton.styleFrom(shape: const StadiumBorder()),
                    child: const Text("Mentor(a)"),
                  ),
                  const SizedBox(width: 15),
                  ElevatedButton(
                    onPressed: null,
                    style:
                        ElevatedButton.styleFrom(shape: const StadiumBorder()),
                    child: const Text("Mentorado(a)"),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Skills",
                    style: TextStyle(
                        color: Color(0xFF535353),
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: const [
                      Text("Adicionar skills"),
                      Icon(Icons.add_box, color: Color(0xFFAFAFAF))
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          shape: const StadiumBorder()),
                      child: const Text("Agilidade")),
                  const SizedBox(width: 15),
                  ElevatedButton(
                    onPressed: () {},
                    style:
                        ElevatedButton.styleFrom(shape: const StadiumBorder()),
                    child: const Text("Lógica da Programação"),
                  ),
                ],
              ),
              Form(
                  child: Padding(
                padding: const EdgeInsets.all(30),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(labelText: "Nome"),
                    ),
                    TextFormField(
                      decoration: const InputDecoration(labelText: "Username"),
                    ),
                    TextFormField(
                      decoration: const InputDecoration(labelText: "Vagas"),
                    ),
                    // TextFormField(
                    //   decoration: const InputDecoration(labelText: "Pronomes"),
                    // ),
                    // TextFormField(
                    //   decoration: const InputDecoration(labelText: "Bio"),
                    // ),
                    // TextFormField(
                    //   decoration: const InputDecoration(labelText: "Formato"),
                    // ),
                    // TextFormField(
                    //   decoration: const InputDecoration(labelText: "Contato"),
                    // ),
                  ],
                ),
              )),
            ],
          ),
        ),
      ],
    );
  }
}
