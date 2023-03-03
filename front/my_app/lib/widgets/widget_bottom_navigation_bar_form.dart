import 'package:flutter/material.dart';

class BottomNavigationBarFormWidget extends StatelessWidget {
  const BottomNavigationBarFormWidget({super.key, required this.title});

  final String title;

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
        child: Text(
          title,
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
