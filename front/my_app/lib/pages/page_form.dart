import 'package:flutter/material.dart';

import '../widgets/widget_appbar_form.dart';
import '../widgets/widget_body_form.dart';
import '../widgets/widget_bottom_navigation_bar_form.dart';
import '../widgets/widget_bottom_navigation_bar_form.dart';

class FormPage extends StatefulWidget {
  FormPage({super.key, required this.title});

  final String title;

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBarFormWidget(title: "Adicionar Skills"),
      body: BodyFormWidget(),
      bottomNavigationBar: BottomNavigationBarFormWidget(),
    );
  }
}
