import 'package:flutter/material.dart';

class BodyFormWidget extends StatefulWidget {
  const BodyFormWidget({super.key});

  @override
  State<BodyFormWidget> createState() => _BodyFormWidgetState();
}

class _BodyFormWidgetState extends State<BodyFormWidget> {
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
    return Container(
      padding: const EdgeInsets.only(top: 50),
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
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
        color: const Color(0xFFEBF0FF),
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
                const Divider(
                  thickness: 1,
                  color: Color(0xFFAFAFAF),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
