import 'package:mentorme/app/modules/home/domain/entities/contact_history_entity.dart';
import 'package:mentorme/app/modules/register/domain/entities/register_entity.dart';

class RegisterParams {
  final RegisterEntity registerEntity;

  RegisterParams(
    this.registerEntity,
  );

  Map<String, dynamic> toBodyRequest() => {
        "id": registerEntity.id,
        "name": registerEntity.name,
        "description": registerEntity.description,
        "contacts": registerEntity.contacts,
        "image": registerEntity.image,
        "can_teach": registerEntity.canTeach,
        "want_to_learn": registerEntity.wantToLearn,
      };
}
