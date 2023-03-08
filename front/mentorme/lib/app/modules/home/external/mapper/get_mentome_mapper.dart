import 'package:mentorme/app/core/domain/entities/mentor_entity.dart';
import 'package:mentorme/app/modules/home/domain/entities/get_mentorme_response.dart';

class GetMentoreMeMapper {
  static GetMentorMeResponse fromJson(List<dynamic> list) {

    final List<MentorEntity> mentors = [];

    for (var json in list) {
      mentors.add(MentorEntity(
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
      ));
    }


    return GetMentorMeResponse(mentors);
  }
}
