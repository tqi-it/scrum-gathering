import 'package:flutter/material.dart';
import 'package:mentorme/app/core/domain/entities/mentor_entity.dart';
import 'package:mentorme/app/modules/home/presenter/home_controller.dart';
import 'package:mentorme/app/shared/components/mentor_me_button.dart';
import 'package:mentorme/app/shared/components/mentorme_alert.dart';
import 'package:mentorme/app/shared/theme/images.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:url_launcher/url_launcher.dart';

void openUrl(String url) async {
  if (!await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication)) {
    throw Exception("Error kdjsdksjdks");
  }
}

class MentorCardWidget extends StatelessWidget {
  const MentorCardWidget({super.key, required this.mentor});

  final MentorEntity mentor;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image(
                      width: 103,
                      height: 82,
                      image: NetworkImage(mentor.imageProfile),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(
                                  left: 12, top: 10, right: 12),
                              child: Text(
                                mentor.name,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF535353),
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 2),
                              child: SizedBox(
                                width: double.infinity,
                                child: Text(
                                  mentor.description,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFFAFAFAF),
                                    fontSize: 16,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 3,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 12),
                        child: SizedBox(
                          width: double.infinity,
                          child: MentorMeButton(
                            label: 'Saiba mais',
                            isActive: mentor.active,
                            labelInactive: 'Indisponível',
                            onPressed: () {
                              Modular.to.pushNamed('/home/mentor_profile_page',
                                  arguments: {
                                    'mentor': mentor,
                                  });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
