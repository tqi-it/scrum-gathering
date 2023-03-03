import 'package:flutter/material.dart';

class BottomNavigationBarFormWidget extends StatelessWidget {
  const BottomNavigationBarFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFEBF0FF),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
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
    );
  }
}
