import 'package:flutter/material.dart';

class MentorMeButton extends StatelessWidget {
  final Function()? onPressed;
  final String label;
  final double? radius;
  const MentorMeButton({Key? key, this.onPressed, required this.label, this.radius}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed ?? (){},
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius ?? 50), // <-- Radius
        ),
      ),
      child: Text(
        label,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}
