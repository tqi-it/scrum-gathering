import 'package:dartz/dartz.dart';
import 'package:mentorme/app/modules/home/domain/entities/contact_history_response.dart';
import 'package:mentorme/app/modules/home/domain/i_repositories/i_contact_history_repository.dart';
import 'package:mentorme/app/modules/home/domain/params/contact_history_params.dart';
import 'package:mentorme/app/shared/contracts/i_error.dart';


abstract class IContactHistoryUsecase {
  Future<Either<IError, ContactHistoryResponse>> call(ContactHistoryParams params);
}

class ContactHistoryUsecase extends IContactHistoryUsecase {
  final IContactHistoryRepository repository;

  ContactHistoryUsecase(this.repository);
  @override
  Future<Either<IError, ContactHistoryResponse>> call(ContactHistoryParams params) async {

    final result = await repository(params);
    return result;
  }
}
