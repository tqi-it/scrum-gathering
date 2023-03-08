
import 'package:mentorme/app/core/data/indexed_errors.dart';
import 'package:mentorme/app/shared/analytics/error_report.dart';

import 'errors.dart';

class ApiDataSourceError extends DataSourceError {
  final dynamic data;
  final dynamic code;
  final List<dynamic>? errors;

  ApiDataSourceError({
    required this.data,
    this.code,
    this.errors,
    required StackTrace stackTrace,
  }) : super(
          message: data,
          stackTrace: stackTrace,
          reportTag: '-> ApiDatasourceError <-',
          indexedCode: IndexedErrors.apiDatasourceError,
        ) {
    _errorReport();
  }

  factory ApiDataSourceError.fromError(dynamic data, StackTrace stackTrace,
      {dynamic code}) {
    throw (data == null ||
            data.isEmpty ||
            data.toString().contains('<html>') ||
            data['errorMessages'][0]['description'] == '')
        ? ApiDataSourceError(
            stackTrace: stackTrace,
            data: 'Erro inesperado',
          )
        : ApiDataSourceError(
            stackTrace: stackTrace,
            data: data['errorMessages'][0]['description'],
            code: data['errorMessages'][0]['code'] ?? '',
            errors: data['errorMessages'][0]['errors']
          );
  }

  void _errorReport() {
    ErrorReport.externalFailureError(
      message,
      stackTrace,
      reportTag!,
      indexedCode!,
    );
  }
}
