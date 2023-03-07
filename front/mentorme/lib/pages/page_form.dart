import 'package:flutter/material.dart';
import 'package:mentorme/pages/page_base.dart';

import '../widgets/widget_appbar_form.dart';
import '../widgets/widget_body_form.dart';
import '../widgets/widget_bottom_navigation_bar_form.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key, required this.title});

  final String title;

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  @override
  Widget build(BuildContext context) {
    return const BasePage(
      appBarWidget: AppBarFormWidget(title: "Adicionar Skills"),
      bodyWidget: BodyFormWidget(),
      bottomNavigationBarWidget: BottomNavigationBarFormWidget(
        title: "Salvar",
      ),
    );
  }
}
