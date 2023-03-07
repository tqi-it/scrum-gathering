import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mentorme/pages/page_basic_test.dart';
import 'package:mentorme/pages/page_create_profile_mentor.dart';
import 'package:mentorme/pages/page_form.dart';
import 'package:mentorme/pages/page_home.dart';

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
         "/": (context) => BasicTestPage(title: 'Mentorme'),
        // "/": (context) => const HomePage(title: 'Mentorme'),
        //  "/": (context) => const FormPage(title: 'Mentorme'),
        // "/": (context) => const CreateProfileMentorPage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
