import 'package:flutter/material.dart';

import '../entity/entity_mentor.dart';

class MentorCardWidget extends StatelessWidget {
  const MentorCardWidget({super.key, required this.mentor});

  // final String name, skill, link, imageLink;
  final MentorEntity mentor;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Container(
        padding: EdgeInsets.all(10),
        width: 300,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image(
                        width: 72,
                        image: NetworkImage(mentor.imageProfile),
                      ),
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      mentor.skill,
                      style: TextStyle(
                        color: Color(0xFF0497E3),
                        fontSize: 10,
                      ),
                    ),
                    SizedBox(
                      width: 120,
                      child: Text(
                        mentor.name,
                        style: TextStyle(
                          color: Color(0xFF535353),
                          fontSize: 15,
                        ),
                      ),
                    ),
                    Text(
                      mentor.availability,
                      style: TextStyle(
                        color: Color(0xFFAFAFAF),
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 15),
                Column(
                  children: [
                    Icon(
                      Icons.favorite_outline,
                      size: 15,
                    ),
                    Text(mentor.likes.toString(),
                        style:
                            TextStyle(color: Color(0xFFAFAFAF), fontSize: 10)),
                    SizedBox(height: 10),
                    Icon(
                      Icons.star,
                      size: 15,
                    ),
                    Text(mentor.rate.toString(),
                        style:
                            TextStyle(color: Color(0xFFAFAFAF), fontSize: 10)),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 9),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: Text("Disponibilidade: ${mentor.slots} vaga(s)"),
                style: ElevatedButton.styleFrom(shape: StadiumBorder()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
