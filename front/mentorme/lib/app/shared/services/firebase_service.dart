import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:mentorme/app/shared/analytics/error_report.dart';
import 'package:mentorme/firebase_options.dart';

class FirebaseService {
  static Future<void> init() async {
    await _initCrashlytics();
  }

  static Future<void> _initCrashlytics() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
    FlutterError.onError = ErrorReport.flutterError;
    await FirebaseCrashlytics.instance.sendUnsentReports();
  }
}
