import 'package:mentorme/app/core/domain/entities/contacts.dart';
import 'package:mentorme/app/core/domain/entities/mentor_entity.dart';
import 'package:mentorme/app/modules/home/domain/entities/get_mentorme_response.dart';
import 'package:mentorme/app/shared/theme/images.dart';
import 'package:mentorme/app/shared/utils/enums.dart';

class GetMentoreMeMapper {
  static GetMentorMeResponse fromJson(List<dynamic> list) {
    final List<MentorEntity> mentors = [];

    List<Contacts> getContacts(List<dynamic> list) {
      final List<Contacts> contacts = [];
      for (var element in list) {
        String type = '';
        String icon = '';
        String elementType = element['type'] ?? '';

        switch (elementType) {
          case 'LINKEDIN':
            type = SocialMediaEnum.linkedin.stringValue;
            icon = ThemeImages.linkedin;
            break;
          case 'WHATSAPP':
            type = SocialMediaEnum.whatsapp.stringValue;
            icon = ThemeImages.whatsapp;
            break;
          case 'TWITTER':
            type = SocialMediaEnum.twitter.stringValue;
            icon = ThemeImages.twitter;
            break;
          case 'TELEGRAM':
            type = SocialMediaEnum.telegram.stringValue;
            icon = ThemeImages.telegram;
            break;
          case 'INSTAGRAM':
            type = SocialMediaEnum.instagram.stringValue;
            icon = ThemeImages.instagram;
            break;
          case 'FACEBOOK':
            type = SocialMediaEnum.facebook.stringValue;
            icon = ThemeImages.facebook;
            break;
          case 'EMAIL':
            type = SocialMediaEnum.email.stringValue;
            icon = ThemeImages.email;
            break;
          default:
            type = SocialMediaEnum.other.stringValue;
            icon = ThemeImages.email;
            break;
        }

        contacts.add(
          Contacts(
            type: type,
            url: element['url'],
            icon: icon,
          ),
        );
      }

      return contacts;
    }

    for (var json in list) {
      mentors.add(
        MentorEntity(
          name: json['name'] ?? '',
          phoneNumber: json['phoneNumber'] ?? '',
          id: json['id'] ?? '',
          skill: json['skill'] ?? '',
          description: json['description'] ?? '',
          imageProfile: json['image'] ?? '',
          profile: json['profile'] ?? '',
          slots: json['slots'] ?? 0,
          availability: json['availability'] ?? '',
          likes: json['likes'] ?? 0,
          rate: json['rate'] ?? 0,
          contacts: getContacts(json['contacts'] ?? []),
          active: json['active'] ?? true,
        ),
      );
    }

    return GetMentorMeResponse(mentors);
  }
}
