import 'package:flutter/material.dart';
import 'package:my_app/widgets/widget_featured_profile.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({super.key, required this.title, required this.factor});

  final String title;
  final double factor;

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight * factor);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
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
        child: Column(
          children: const [
            Text("flexibleSpace"),
            Text("flexibleSpace"),
            Text("flexibleSpace"),
            Text("flexibleSpace"),
          ],
        ),
      ),
      bottom: const FeaturedProfileWidget(),
    );
  }
}
