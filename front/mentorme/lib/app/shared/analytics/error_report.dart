import 'dart:io';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:mentorme/app/core/data/indexed_errors.dart';

class ErrorReport {
  static Future<void> _report(
    dynamic exception,
    StackTrace stackTrace,
    String tag,
    String errorCode,
  ) async {
    if (!(Platform.environment.containsKey('FLUTTER_TEST')) &&
        exception != null) {
      final errorTag = '$errorCode $tag';
      debugPrintStack(label: errorTag, stackTrace: stackTrace);
      await FirebaseCrashlytics.instance.setCustomKey(
        errorTag,
        exception.toString(),
      );
      await FirebaseCrashlytics.instance.log(exception.toString());
      await FirebaseCrashlytics.instance.recordError(exception, stackTrace);
    }
  }

  static Future<void> internalFailureError(
    dynamic exception,
    StackTrace stackTrace,
    String tag,
    String errorCode,
  ) async {
    await _report(exception, stackTrace, 'INTERNAL_FAILURE: $tag', errorCode);
  }

  static Future<void> externalFailureError(
    dynamic exception,
    StackTrace stackTrace,
    String tag,
    String errorCode,
  ) async {
    await _report(exception, stackTrace, 'EXTERNAL_FAILURE: $tag', errorCode);
  }

  static Future<void> zonedGuardedError(
    dynamic exception,
    StackTrace stackTrace,
    String errorCode,
  ) async {
    await _report(exception, stackTrace, 'ZONED_GUARDED', errorCode);
  }

  static Future<void> flutterError(FlutterErrorDetails errorDetails) async {
    await _report(
      errorDetails.exception,
      errorDetails.stack ?? StackTrace.current,
      errorDetails.context.toString(),
      IndexedErrors.flutterError,
    );
  }
}
