import 'package:flutter/material.dart';

class FeaturedProfileWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const FeaturedProfileWidget({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight * 2);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("Perfil em destaque"),
        Container(
          height: 200,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: NetworkImage("https://picsum.photos/id/237/200/300"),
                fit: BoxFit.cover),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const [
              Text(
                "Agilidade",
                style: TextStyle(color: Colors.white),
              ),
              Text(
                "Beltrano Ferreira",
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

    //  child: const Card(
    //     color: Colors.transparent,
    //     shadowColor: Colors.transparent,
    //     child: const Text(
    //       "oi",
    //       style: TextStyle(color: Colors.white),
    //     ),