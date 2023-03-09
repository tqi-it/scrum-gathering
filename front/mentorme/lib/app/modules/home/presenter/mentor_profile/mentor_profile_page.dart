import 'package:flutter/material.dart';
import 'package:mentorme/app/core/domain/entities/mentor_entity.dart';
import 'package:mentorme/app/shared/components/mentorme_big_app_bar.dart';
import 'package:mentorme/app/shared/components/mentorme_content_page.dart';

class MentorProfilePage extends StatefulWidget {
  final MentorEntity mentorEntity;
  const MentorProfilePage({Key? key, required this.mentorEntity}) : super(key: key);

  @override
  State<MentorProfilePage> createState() => _MentorProfilePageState();
}

class _MentorProfilePageState extends State<MentorProfilePage> {
  @override
  Widget build(BuildContext context) {
    return MentorMeContentPage(
      pageName: 'Profile',
      appBar: const MentorMeBigAppBar(pageName: 'Profile',),
      child: Container(),
    );
  }
}
