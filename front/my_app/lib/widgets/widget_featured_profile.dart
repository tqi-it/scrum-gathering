import 'package:flutter/material.dart';

class FeaturedProfileWidget extends StatelessWidget {
  const FeaturedProfileWidget(
      {super.key,
      required this.name,
      required this.skill,
      required this.link,
      required this.imageLink});

  final String name, skill, link, imageLink;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Perfil em destaque",
          style: TextStyle(color: Colors.white, fontSize: 12),
        ),
        const SizedBox(height: 14),
        Container(
          child: Container(
            height: 204,
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(imageLink), fit: BoxFit.fitWidth),
                borderRadius: const BorderRadius.all(Radius.circular(6))),
            child: Container(
              padding: EdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    skill,
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  Text(
                    name,
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(50),
                    ),
                    child: const Text("Visualizar perfil"),
                  )
                ],
              ),
            ),
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
