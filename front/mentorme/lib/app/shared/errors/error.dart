import '../../core/data/indexed_errors.dart';
import '../analytics/error_report.dart';
import 'errors.dart';

class Error extends IError {
  Error({
    required String message,
    required StackTrace stackTrace,
  }) : super(
    message: message,
    stackTrace: stackTrace,
    reportTag: '-> Error <-',
    errorCode: IndexedErrors.domainError,
  ) {
    //_errorReport();
  }

  void _errorReport() {
    ErrorReport.internalFailureError(
      message,
      stackTrace,
      reportTag!,
      IndexedErrors.domainError,
    );
  }
}
