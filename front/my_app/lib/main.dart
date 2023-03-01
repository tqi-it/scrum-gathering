import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/pages/page_home.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mentorme',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        fontFamily: GoogleFonts.roboto().fontFamily,
        // colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFFD9385E)),
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => const HomePage(title: 'Mentorme'),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
