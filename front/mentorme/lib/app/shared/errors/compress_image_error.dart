import 'errors.dart';

class CompressImageError extends DataSourceError {
  final String errorMessage;

  CompressImageError({
    required String errorCode,
    required StackTrace stackTrace,
    required this.errorMessage,
  }) : super(
          message: 'Erro inesperado',
          stackTrace: stackTrace,
          reportTag: '$errorCode CompressImageError -> $errorMessage',
          indexedCode: errorCode,
        );
}
