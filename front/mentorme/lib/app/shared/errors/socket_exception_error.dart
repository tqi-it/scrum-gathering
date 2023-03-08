import '../../core/data/indexed_errors.dart';
import '../analytics/error_report.dart';
import 'errors.dart';

class SocketExceptionError extends DataSourceError {
  SocketExceptionError({
    required String message,
    required StackTrace stackTrace,
  }) : super(
          message: message,
          stackTrace: stackTrace,
          reportTag: '-> SocketExceptionError <-',
          indexedCode: IndexedErrors.socketExceptionError,
        ) {
    _errorReport();
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
