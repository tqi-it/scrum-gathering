import 'errors.dart';

class MapperError extends DataSourceError {
  final String errorMessage;
  final String mapperName;

  MapperError({
    required String errorCode,
    required StackTrace stackTrace,
    required this.errorMessage,
    required this.mapperName,
  }) : super(
          message: 'Erro inesperado',
          stackTrace: stackTrace,
          reportTag: '$errorCode $mapperName -> $errorMessage',
          indexedCode: errorCode,
        );
}
