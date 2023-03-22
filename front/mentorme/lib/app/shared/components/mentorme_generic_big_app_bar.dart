import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mentorme/app/core/domain/entities/mentor_entity.dart';

class MentorMeGenericBigAppBar extends StatelessWidget {
  final String pageName;

  const MentorMeGenericBigAppBar({Key? key, required this.pageName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFF0A7DB8),
      flexibleSpace: Container(
        padding: const EdgeInsets.only(top: 10),
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.only(top: AppBar().preferredSize.height),
        height: 210,
        color: const Color(0xFF0A7DB8),
        child: Column(
          children: [
            SizedBox(
              height: 30,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    pageName,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: const CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(
                    "https://user-images.githubusercontent.com/11250/39013954-f5091c3a-43e6-11e8-9cac-37cf8e8c8e4e.jpg"),
                backgroundColor: Colors.transparent,
              ),
            ),
            const SizedBox(height: 5),
            const Text("Alterar foto de perfil",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF00F0FF),
                )),
            const SizedBox(height: 19)
          ],
        ),
      ),
    );
  }
}
