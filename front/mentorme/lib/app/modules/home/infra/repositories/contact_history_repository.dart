import 'package:dartz/dartz.dart';
import 'package:mentorme/app/modules/home/domain/entities/contact_history_response.dart';
import 'package:mentorme/app/modules/home/domain/i_repositories/i_contact_history_repository.dart';
import 'package:mentorme/app/modules/home/domain/params/contact_history_params.dart';
import 'package:mentorme/app/modules/home/infra/i_datasources/i_contact_history_datasource.dart';
import 'package:mentorme/app/shared/contracts/i_error.dart';
import 'package:mentorme/app/shared/errors/datasource_error.dart';

class ContactHistoryRepository extends IContactHistoryRepository {
  final IContactHistoryDatasource datasource;

  ContactHistoryRepository(this.datasource);
  @override
  Future<Either<IError, ContactHistoryResponse>> call(ContactHistoryParams params) async {
    try {
      var result = await datasource(params);
      return Right(result);
    } on DataSourceError catch (e) {
      return Left(e);
    } catch (e, s) {
      return Left(DataSourceError(message: e.toString(), stackTrace: s));
    }
  }
}
