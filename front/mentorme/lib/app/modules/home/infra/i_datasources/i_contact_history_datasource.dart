import 'package:mentorme/app/modules/home/domain/entities/contact_history_response.dart';
import 'package:mentorme/app/modules/home/domain/params/contact_history_params.dart';

abstract class IContactHistoryDatasource {
  Future<ContactHistoryResponse> call(ContactHistoryParams params);
}