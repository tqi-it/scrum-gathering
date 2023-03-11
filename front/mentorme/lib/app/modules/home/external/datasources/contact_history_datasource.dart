import 'package:dio/dio.dart';
import 'package:mentorme/app/modules/home/domain/entities/contact_history_response.dart';
import 'package:mentorme/app/modules/home/domain/params/contact_history_params.dart';
import 'package:mentorme/app/modules/home/infra/i_datasources/i_contact_history_datasource.dart';
import 'package:mentorme/app/shared/data/api_constants.dart';
import 'package:mentorme/app/shared/data/endpoints.dart';
import 'package:mentorme/app/shared/errors/api_datasource_error.dart';
import 'package:mentorme/app/shared/errors/datasource_error.dart';
import 'package:mentorme/app/shared/errors/socket_exception_error.dart';
import 'package:mentorme/app/shared/services/http_service/http_service.dart';


class ContactHistoryDatasource extends IContactHistoryDatasource {
  final IHttpService httpService;

  ContactHistoryDatasource(this.httpService);

  @override
  Future<ContactHistoryResponse> call(ContactHistoryParams params) async {
    try {
      const _enviroment = ApiConstants.mentormeEnv;
      httpService.setEnviroment(_enviroment);
      httpService.disableCertificates(httpService);

      final _response = await httpService.post(
        Endpoints.contactHistory,
        data: params.toBodyRequest(),
      );

      return ContactHistoryResponse(_response.statusCode ?? 0);
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
