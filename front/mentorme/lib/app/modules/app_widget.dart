import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mentorme/app/shared/services/navigator/navigation_service.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> with WidgetsBindingObserver{

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context){

    Modular.setNavigatorKey(NavigationService.navigatorKey);
    Modular.setInitialRoute('/onboarding');

    return MaterialApp.router(
      title: 'MentorME',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        fontFamily: GoogleFonts.roboto().fontFamily,
        // colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFFD9385E)),
      ),
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
    );
  }
}
