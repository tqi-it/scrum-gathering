import 'package:flutter/material.dart';

class FormPage extends StatelessWidget {
  const FormPage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        title: Text(
          "Adicionar Skills",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromARGB(204, 10, 125, 184),
                Color.fromARGB(204, 0, 40, 60)
              ],
            ),
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(10),
        child: ListView(
          children: [
            GestureDetector(
              onTap: () {
                print("Agilidade");
              },
              child: Text(
                "Agilidade",
              ),
            ),
            Divider(
              thickness: 1,
              color: Color(0xFFAFAFAF),
            ),
            GestureDetector(
              onTap: () {
                print("Lógica de Programação");
              },
              child: Text(
                "Lógica de Programação",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
