import 'package:flutter/material.dart';
import 'package:mentorme/app/core/domain/entities/mentor_entity.dart';
import 'package:mentorme/app/shared/components/mentor_me_button.dart';
import 'package:mentorme/app/shared/components/mentorme_alert.dart';
import 'package:mentorme/app/shared/theme/images.dart';
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
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image(
                    width: 103,
                    height: 82,
                    image: NetworkImage(mentor.imageProfile),
                    fit: BoxFit.fitWidth,
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 12, top: 10, right: 12),
                        child: Text(
                          mentor.name,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF535353),
                            fontSize: 15,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                        child: SizedBox(
                          width: double.infinity,
                          child: Text(
                            mentor.description,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFAFAFAF),
                              fontSize: 10,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                          ),
                        ),
                      ),
                      // Text(
                      //   mentor.availability,
                      //   style: TextStyle(
                      //     color: Color(0xFFAFAFAF),
                      //     fontSize: 10,
                      //   ),
                      // ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 12),
                        child: SizedBox(
                          width: double.infinity,
                          child: MentorMeButton(
                            label: 'Fale comigo',
                            isActive: mentor.active,
                            onPressed: () {
                              List<MentorMeButton> buttons = [];

                              for (var element in mentor.contacts) {
                                buttons.add(
                                  MentorMeButton(
                                    label: element.type ?? '',
                                    icon: element.type!.contains('Whatsapp') ? ThemeImages.whatsapp : ThemeImages.linkedin,
                                    onPressed: () {
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
