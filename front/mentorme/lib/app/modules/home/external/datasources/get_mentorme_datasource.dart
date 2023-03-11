import 'package:dio/dio.dart';
import 'package:mentorme/app/modules/home/domain/entities/get_mentorme_response.dart';
import 'package:mentorme/app/modules/home/domain/params/get_mentor_params.dart';
import 'package:mentorme/app/modules/home/external/mapper/get_mentome_mapper.dart';
import 'package:mentorme/app/modules/home/infra/i_datasources/i_mentorme_datasource.dart';
import 'package:mentorme/app/shared/data/api_constants.dart';
import 'package:mentorme/app/shared/data/endpoints.dart';
import 'package:mentorme/app/shared/errors/api_datasource_error.dart';
import 'package:mentorme/app/shared/errors/datasource_error.dart';
import 'package:mentorme/app/shared/errors/socket_exception_error.dart';
import 'package:mentorme/app/shared/services/http_service/http_service.dart';


class GetMentorMeDatasource extends IGetMentorMeDatasource {
  final IHttpService httpService;

  GetMentorMeDatasource(this.httpService);

  @override
  Future<GetMentorMeResponse> call(GetMentorMeParams? params) async {
    try {
      const _enviroment = ApiConstants.mentormeEnv;
      httpService.setEnviroment(_enviroment);
      httpService.disableCertificates(httpService);

      final _response = await httpService.post(
        Endpoints.getMentorMe,
        data: params!.toBodyRequest(),
      );

      final _finalResponse = GetMentoreMeMapper.fromJson(_response.data);
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
