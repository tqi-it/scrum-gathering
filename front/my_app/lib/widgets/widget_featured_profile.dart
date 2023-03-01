import 'package:flutter/material.dart';

class FeaturedProfileWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const FeaturedProfileWidget({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return const Text("featured profile");
  }
}
