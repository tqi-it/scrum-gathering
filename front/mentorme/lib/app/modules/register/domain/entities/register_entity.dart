import 'package:mentorme/app/core/domain/entities/contacts.dart';

class RegisterEntity {
  int id;
  String name;
  String description;
  List<Map<String, String>> contacts;
  String image;
  bool canTeach;
  bool wantToLearn;

  RegisterEntity(
      {required this.id,
      required this.name,
      required this.description,
      required this.contacts,
      required this.image,
      required this.canTeach,
      required this.wantToLearn});
}
