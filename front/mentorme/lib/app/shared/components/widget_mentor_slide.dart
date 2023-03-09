import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mentorme/app//shared/components/widget_featured_profile.dart';
import 'package:mentorme/app/core/domain/entities/mentor_entity.dart';
import 'package:mentorme/app/shared/components/widget_mentor_card.dart';


class MentorSlideWidget extends StatelessWidget {
  MentorSlideWidget({super.key});

  final MentorEntity mentor = MentorEntity(
      name: "Beltrano Gomes Pereira",
      id: 0,
      description: "",
      phoneNumber: "",
      skill: "Agilidade",
      profile: "#",
      imageProfile:
          "https://s3-alpha-sig.figma.com/img/2714/6c52/9b73f122051d33a591bb28d724f80cd8?Expires=1678665600&Signature=R3ME5R90uBWzt0CtS6I1hs8Lc6U0wpHLnWk0bl15HTmQNEpAUkryX3csozuedizDrYf8gwYqHzt9z3CTE~FK3q4q-5w-7XEVu6OfpIIjNPTb6huEqmnRXYCDwobJB4ZoRSeDb1gKcqJb0Xw0JHmjjtrjOAuIhEPWnW5Z1QZ0kI0g1DhtQCdGhD3YfbyzEi3fqsu3GWIOE2tNpFhTLsu4HpJSvTOAoPZ0qkpyOl3O0X~2CIz6s775nuGuQbnfs7hqOSWYOXRmCz2-IfCb25Rw-18eNkjxif7s8uvPFcaJ3Bv6P38heTcExEgKnLqmT6LhKcCIQFr9lbQ7c6ivBjlfwA__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4",
      availability: "Manhã, tarde e noite",
      slots: 1,
      likes: 999,
      rate: 4.9, contacts: [], active: true);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(15, 50, 15, 20),
          child: FeaturedProfileWidget(mentor: mentor),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          color: Color(0xFFEBF0FF),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Visualizados Recentemente",
                style: TextStyle(
                    color: Color(0xFF535353),
                    fontSize: 12,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 5),
              SizedBox(
                height: 120,
                child: ListView(padding: EdgeInsets.all(0), children: [
                  CarouselSlider(
                    items: [
                      MentorCardWidget(
                        mentor: mentor,
                      ),
                      MentorCardWidget(
                        mentor: mentor,
                      ),
                      MentorCardWidget(
                        mentor: mentor,
                      ),
                    ],
                    options: CarouselOptions(
                      enlargeCenterPage: true,
                      autoPlay: true,
                      aspectRatio: 16 / 9,
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enableInfiniteScroll: true,
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      viewportFraction: 0.8,
                    ),
                  ),
                ]),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
