import 'package:dartz/dartz.dart';
import 'package:mentorme/app/modules/home/domain/entities/get_mentorme_response.dart';
import 'package:mentorme/app/modules/home/domain/i_repositories/i_get_mentor_repository.dart';
import 'package:mentorme/app/modules/home/domain/params/get_mentor_params.dart';
import 'package:mentorme/app/shared/contracts/i_error.dart';


abstract class IGetMentorMeUsecase {
  Future<Either<IError, GetMentorMeResponse>> call({GetMentorMeParams? params});
}

class GetMentorMeUsecase extends IGetMentorMeUsecase {
  final IGetMentorMeRepository repository;

  GetMentorMeUsecase(this.repository);
  @override
  Future<Either<IError, GetMentorMeResponse>> call({GetMentorMeParams? params}) async {

    final result = await repository(params);
    return result;
  }
}
