import '../../core/data/indexed_errors.dart';
import '../analytics/error_report.dart';
import 'errors.dart';

class DataSourceError extends IError {
  final String? indexedCode;

  DataSourceError({
    required message,
    required stackTrace,
    this.indexedCode,
    String? reportTag,
  }) : super(
          message: message,
          stackTrace: stackTrace,
          reportTag: reportTag ?? '-> DatasourceError <-',
          errorCode: indexedCode ?? IndexedErrors.datasourceError,
        ) {
    _errorReport();
  }

  void _errorReport() {
    ErrorReport.externalFailureError(
      message,
      stackTrace,
      reportTag ?? '',
      indexedCode ?? '',
    );
  }
}
