import 'package:mentorme/app/modules/home/domain/entities/get_mentorme_response.dart';
import 'package:mentorme/app/modules/home/domain/params/get_mentor_params.dart';

abstract class IGetMentorMeDatasource {
  Future<GetMentorMeResponse> call(GetMentorMeParams? params);
}