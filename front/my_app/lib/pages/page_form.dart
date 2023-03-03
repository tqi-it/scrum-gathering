import 'package:flutter/material.dart';

class FormPage extends StatefulWidget {
  FormPage({super.key, required this.title});

  final String title;

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final Map<String, bool> skillsList = {
    "Agilidade": false,
    "Front-end Development": false,
    "Back-end Development": true,
    "Ux/Ui Design": false,
    "Graphic Design": false,
    "Lógica de Programação": false,
    "Lorem Ipsum1": false,
    "Lorem Ipsum2": false,
    "Lorem Ipsum3": false,
    "Lorem Ipsum4": false
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          "Adicionar Skills",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.only(top: 50),
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
        width: double.infinity,
        child: Container(
          padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
          color: Color(0xFFEBF0FF),
          child: ListView.builder(
            itemCount: skillsList.length,
            itemBuilder: (context, index) {
              String key = skillsList.keys.elementAt(index);
              bool isSelected = skillsList[key]!;
              return Column(
                children: [
                  ListTile(
                    onTap: () {
                      skillsList[key] = !skillsList[key]!;
                      isSelected = skillsList[key]!;
                      setState(() {});
                    },
                    title: Text(
                      skillsList.keys.elementAt(index),
                      style: TextStyle(
                        color: isSelected
                            ? const Color(0xFFD9385E)
                            : const Color(0xFF535353),
                        fontWeight:
                            isSelected ? FontWeight.bold : FontWeight.normal,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  Divider(
                    thickness: 1,
                    color: Color(0xFFAFAFAF),
                  ),
                ],
              );
            },
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: Color(0xFFEBF0FF),
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 25),
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            minimumSize: const Size.fromHeight(50),
          ),
          child: const Text(
            "Salvar",
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
