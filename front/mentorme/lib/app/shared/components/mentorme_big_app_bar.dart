import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mentorme/app/core/domain/entities/mentor_entity.dart';

class MentorMeBigAppBar extends StatelessWidget {
  final Function()? onTap;
  final String pageName;
  final MentorEntity mentor;

  const MentorMeBigAppBar(
      {Key? key, this.onTap, required this.pageName, required this.mentor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(

      backgroundColor: Color(0xFF0A7DB8),
      flexibleSpace: Container(
        padding: EdgeInsets.only(top: 18),
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.only(top: AppBar().preferredSize.height),
        height: 175,
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
              child: CircleAvatar(
                radius: 36,
                backgroundImage: NetworkImage(mentor.imageProfile),
                backgroundColor: Colors.transparent,
              ),
            ),
            const SizedBox(height: 5),
            Text(mentor.name,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                )),
            const SizedBox(height: 19)
          ],
        ),
      ),
    );
  }
}
