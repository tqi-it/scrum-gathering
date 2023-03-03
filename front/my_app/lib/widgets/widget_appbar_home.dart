import 'package:flutter/material.dart';

class AppBarHomeWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarHomeWidget({super.key, required this.title});

  final String title;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }
}
