import 'package:dio/dio.dart';
import 'package:mentorme/app/modules/home/domain/entities/skill_response.dart';
import 'package:mentorme/app/modules/home/external/mapper/skill_mapper.dart';
import 'package:mentorme/app/modules/home/infra/i_datasources/i_skill_datasource.dart';
import 'package:mentorme/app/shared/data/api_constants.dart';
import 'package:mentorme/app/shared/data/endpoints.dart';
import 'package:mentorme/app/shared/errors/api_datasource_error.dart';
import 'package:mentorme/app/shared/errors/datasource_error.dart';
import 'package:mentorme/app/shared/errors/socket_exception_error.dart';
import 'package:mentorme/app/shared/services/http_service/http_service.dart';


class SkillDatasource extends ISkillDatasource {
  final IHttpService httpService;

  SkillDatasource(this.httpService);

  @override
  Future<SkillResponse> call() async {
    try {
      const _enviroment = ApiConstants.mentormeEnv;
      httpService.setEnviroment(_enviroment);
      httpService.disableCertificates(httpService);

      final _response = await httpService.get(
        Endpoints.listSkills,
      );

      final _finalResponse = SkillMapper.fromJson(_response.data);
      return _finalResponse;
    } on DioError catch (e, s) {
      e.type == DioErrorType.connectTimeout
          ? throw SocketExceptionError(
              message: e.error,
              stackTrace: s,
            )
          : throw ApiDataSourceError.fromError(e.response?.data, s);
    } catch (e, s) {
      throw DataSourceError(message: e.toString(), stackTrace: s);
    }
  }
}
