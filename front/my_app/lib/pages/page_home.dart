import 'package:flutter/material.dart';
import 'package:my_app/widgets/widget_bottom_navigation_bar.dart';
import 'package:my_app/widgets/widget_featured_profile.dart';

import '../widgets/widget_mentor_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text("Mentorme"),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
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
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(15, 50, 15, 20),
              child: const FeaturedProfileWidget(
                  skill: "Agilidade",
                  name: "Beltrano Ferreira",
                  link: "#",
                  imageLink:
                      "https://s3-alpha-sig.figma.com/img/2714/6c52/9b73f122051d33a591bb28d724f80cd8?Expires=1678665600&Signature=R3ME5R90uBWzt0CtS6I1hs8Lc6U0wpHLnWk0bl15HTmQNEpAUkryX3csozuedizDrYf8gwYqHzt9z3CTE~FK3q4q-5w-7XEVu6OfpIIjNPTb6huEqmnRXYCDwobJB4ZoRSeDb1gKcqJb0Xw0JHmjjtrjOAuIhEPWnW5Z1QZ0kI0g1DhtQCdGhD3YfbyzEi3fqsu3GWIOE2tNpFhTLsu4HpJSvTOAoPZ0qkpyOl3O0X~2CIz6s775nuGuQbnfs7hqOSWYOXRmCz2-IfCb25Rw-18eNkjxif7s8uvPFcaJ3Bv6P38heTcExEgKnLqmT6LhKcCIQFr9lbQ7c6ivBjlfwA__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4"),
            ),
            Container(
              color: Color.fromARGB(255, 255, 0, 0),
              width: double.infinity,
              child: Column(
                children: [
                  MentorCardWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavigationBarWidget(),
    );
  }
}
