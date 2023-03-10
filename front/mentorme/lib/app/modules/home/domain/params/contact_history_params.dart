import 'package:mentorme/app/modules/home/domain/entities/contact_history_entity.dart';

class ContactHistoryParams {
  final ContactHistoryEntity contactHistoryEntity;

  ContactHistoryParams(this.contactHistoryEntity,);

  Map<String, dynamic> toBodyRequest() => {
    "mentor": contactHistoryEntity.mentor,
    "person_to": contactHistoryEntity.personTo,
    "contact_value": contactHistoryEntity.contactValue,
    "contact_type": contactHistoryEntity.contactType,
  };
}

