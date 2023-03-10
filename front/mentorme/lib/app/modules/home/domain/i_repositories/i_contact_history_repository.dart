import 'package:dartz/dartz.dart';
import 'package:mentorme/app/modules/home/domain/entities/contact_history_response.dart';
import 'package:mentorme/app/modules/home/domain/params/contact_history_params.dart';
import 'package:mentorme/app/shared/contracts/i_error.dart';

abstract class IContactHistoryRepository {
  Future<Either<IError, ContactHistoryResponse>> call(ContactHistoryParams params);
}
