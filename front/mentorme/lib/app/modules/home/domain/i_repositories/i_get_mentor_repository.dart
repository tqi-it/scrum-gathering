import 'package:dartz/dartz.dart';
import 'package:mentorme/app/modules/home/domain/entities/get_mentorme_response.dart';
import 'package:mentorme/app/modules/home/domain/params/get_mentor_params.dart';
import 'package:mentorme/app/shared/contracts/i_error.dart';

abstract class IGetMentorMeRepository {
  Future<Either<IError, GetMentorMeResponse>> call(GetMentorMeParams? params);
}
