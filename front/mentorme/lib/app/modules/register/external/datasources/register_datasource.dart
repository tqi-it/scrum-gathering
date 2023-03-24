import 'package:dio/dio.dart';
import 'package:mentorme/app/modules/register/domain/entities/register_response.dart';
import 'package:mentorme/app/modules/register/domain/params/register_params.dart';
import 'package:mentorme/app/modules/register/infra/i_datasources/i_register_datasource.dart';
import 'package:mentorme/app/shared/data/api_constants.dart';
import 'package:mentorme/app/shared/data/endpoints.dart';
import 'package:mentorme/app/shared/errors/api_datasource_error.dart';
import 'package:mentorme/app/shared/errors/datasource_error.dart';
import 'package:mentorme/app/shared/errors/socket_exception_error.dart';
import 'package:mentorme/app/shared/services/http_service/http_service.dart';

class RegisterDatasource extends IRegisterDatasource {
  final IHttpService httpService;

  RegisterDatasource(this.httpService);

  @override
  Future<RegisterResponse> call(RegisterParams params) async {
    try {
      const _enviroment = ApiConstants.mentormeEnv;
      httpService.setEnviroment(_enviroment);
      httpService.disableCertificates(httpService);

      final _response = await httpService.post(
        Endpoints.register,
        data: params.toBodyRequest(),
      );

      return RegisterResponse(_response.statusCode ?? 0);
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
