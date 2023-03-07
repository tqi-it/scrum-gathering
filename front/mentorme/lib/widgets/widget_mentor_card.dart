import 'package:flutter/material.dart';

import '../entity/entity_mentor.dart';

class MentorCardWidget extends StatelessWidget {
  const MentorCardWidget({super.key, required this.mentor});

  // final String name, skill, link, imageLink;
  final MentorEntity mentor;
  final String url =
      "https://s3-alpha-sig.figma.com/img/c007/3bb1/fc0a874efa27c910f03e26ccb8d5d845?Expires=1679270400&Signature=qd~Y20xbMIr97iffVI0T86qQWnYPnxaV26Dlz7sgxIfmfNlY91jTal4zwt3DWeeH17oKhXUHwG3dW-t8fJamvZ8lu5COC4zeNGdgWzCIH0hVYkIz9DKZMNMW9tUwDQSF8HERsudHqbug~gxETWLcH0Rztdv8qE3~1f8CFCWCyF4EUUXfV1Sdohn~yUIClymFlT~U~hwrqeYwShGo~moC6Jsnk-xzsOEN1M84zbuZ05voG05TnKmdxPqg3rSNEyffDPWH-HqJ8gtb-TpoO~a34wRuyCnKBnk2olg4Tm1Dv411Ddi4bIISTdENBlmeJdNMs~AtjX~RQqwJpz6KWC6GTA__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4";

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Container(
        padding: const EdgeInsets.all(8),
        width: 300,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image(
                      width: 103,
                      height: 82,
                      image: NetworkImage(url),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin:
                            const EdgeInsets.only(left: 12, top: 10, right: 12),
                        child: Text(
                          mentor.name,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF535353),
                            fontSize: 15,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 2),
                        child: SizedBox(
                          width: double.infinity,
                          child: Text(
                            mentor.description,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFAFAFAF),
                              fontSize: 10,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                          ),
                        ),
                      ),
                      // Text(
                      //   mentor.availability,
                      //   style: TextStyle(
                      //     color: Color(0xFFAFAFAF),
                      //     fontSize: 10,
                      //   ),
                      // ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 12),
                        child: SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                shape: const StadiumBorder()),
                            child: const Text(
                              "Fale comigo",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                //const SizedBox(width: 15),
                // Column(
                //   children: [
                //     Icon(
                //       Icons.favorite_outline,
                //       size: 15,
                //     ),
                //     Text(mentor.likes.toString(),
                //         style:
                //             TextStyle(color: Color(0xFFAFAFAF), fontSize: 10)),
                //     SizedBox(height: 10),
                //     Icon(
                //       Icons.star,
                //       size: 15,
                //     ),
                //     Text(mentor.rate.toString(),
                //         style:
                //             TextStyle(color: Color(0xFFAFAFAF), fontSize: 10)),
                //   ],
                // ),
              ],
            ),
            // SizedBox(
            //   width: double.infinity,
            //   child: ElevatedButton(
            //     onPressed: () {},
            //     child: Text("Disponibilidade: ${mentor.slots} vaga(s)"),
            //     style: ElevatedButton.styleFrom(shape: StadiumBorder()),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
