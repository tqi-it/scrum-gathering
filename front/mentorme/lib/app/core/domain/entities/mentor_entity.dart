import 'package:mentorme/app/core/domain/entities/contacts.dart';

class MentorEntity {
  final String name;
  final String skill;
  final String profile;
  final String imageProfile;
  final String availability;
  final String description;
  final int slots;
  final int likes;
  final String phoneNumber;
  final int id;
  final double rate;
  final bool active;
  final List<Contacts> contacts;

  MentorEntity({
    required this.name,
    required this.phoneNumber,
    required this.skill,
    required this.id,
    required this.description,
    required this.profile,
    required this.imageProfile,
    required this.availability,
    required this.slots,
    required this.likes,
    required this.rate,
    required this.active,
    required this.contacts,
  });
}
