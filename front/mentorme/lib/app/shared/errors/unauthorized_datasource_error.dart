import 'package:mentorme/app/core/data/indexed_errors.dart';
import 'package:mentorme/app/shared/analytics/error_report.dart';
import 'datasource_error.dart';

class UnauthorizedDatasourceError extends DataSourceError {
  final bool? isLogout;

  UnauthorizedDatasourceError({
    required String message,
    required StackTrace stackTrace,
    this.isLogout,
  }) : super(
          message: message,
          stackTrace: stackTrace,
          reportTag: '-> UnauthorizationDatasourceError <-',
          indexedCode: IndexedErrors.unauthorizedDatasourceError,
        ) {
    _errorReport();
  }

  factory UnauthorizedDatasourceError.fromError(
    dynamic data,
    StackTrace stackTrace,
  ) {
    if (data == null || data.isEmpty || data['message'] == null) {
      throw UnauthorizedDatasourceError(
        stackTrace: stackTrace,
        message: 'Erro inesperado',
      );
    } else {
      if (data['path'] != null && data['path'].toString().contains('logout')) {
        throw UnauthorizedDatasourceError(
          stackTrace: stackTrace,
          message: data['message'],
          isLogout: true,
        );
      } else {
        throw UnauthorizedDatasourceError(
          stackTrace: stackTrace,
          message: data['message'],
        );
      }
    }
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
