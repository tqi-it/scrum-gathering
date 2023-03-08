import 'package:mentorme/app/core/domain/entities/mentor_entity.dart';

class GetMentorMeResponse{
  final List<MentorEntity> mentorEntity;

  GetMentorMeResponse(this.mentorEntity);
}