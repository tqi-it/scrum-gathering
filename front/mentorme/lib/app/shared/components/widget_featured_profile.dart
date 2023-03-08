import 'package:flutter/material.dart';
import 'package:mentorme/app/core/domain/entities/mentor_entity.dart';

class FeaturedProfileWidget extends StatelessWidget {
  const FeaturedProfileWidget({
    super.key,
    required this.mentor,
  });

  final MentorEntity mentor;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Perfil em destaque",
          style: TextStyle(color: Colors.white, fontSize: 12),
        ),
        const SizedBox(height: 14),
        Container(
          child: Container(
            height: 204,
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(mentor.imageProfile),
                    fit: BoxFit.fitWidth),
                borderRadius: const BorderRadius.all(Radius.circular(6))),
            child: Container(
              padding: EdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    mentor.skill,
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  Text(
                    mentor.name,
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(50),
                    ),
                    child: const Text("Visualizar perfil"),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
