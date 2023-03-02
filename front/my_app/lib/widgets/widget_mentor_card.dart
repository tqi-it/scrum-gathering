import 'package:flutter/material.dart';

class MentorCardWidget extends StatelessWidget {
  const MentorCardWidget({super.key});

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
                  children: const [
                    Image(
                      width: 72,
                      image: NetworkImage(
                          'https://s3-alpha-sig.figma.com/img/2714/6c52/9b73f122051d33a591bb28d724f80cd8?Expires=1678665600&Signature=R3ME5R90uBWzt0CtS6I1hs8Lc6U0wpHLnWk0bl15HTmQNEpAUkryX3csozuedizDrYf8gwYqHzt9z3CTE~FK3q4q-5w-7XEVu6OfpIIjNPTb6huEqmnRXYCDwobJB4ZoRSeDb1gKcqJb0Xw0JHmjjtrjOAuIhEPWnW5Z1QZ0kI0g1DhtQCdGhD3YfbyzEi3fqsu3GWIOE2tNpFhTLsu4HpJSvTOAoPZ0qkpyOl3O0X~2CIz6s775nuGuQbnfs7hqOSWYOXRmCz2-IfCb25Rw-18eNkjxif7s8uvPFcaJ3Bv6P38heTcExEgKnLqmT6LhKcCIQFr9lbQ7c6ivBjlfwA__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4'),
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text("Agilidade"),
                    Text("Beltrano Gomes Pereira"),
                    Text("Manhã, tarde e noite"),
                  ],
                ),
                SizedBox(width: 15),
                Column(
                  children: [
                    Icon(
                      Icons.favorite_outline,
                      size: 15,
                    ),
                    SizedBox(height: 10),
                    Icon(
                      Icons.star,
                      size: 15,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {},
              child: Text("Disponibilidade: 2 vagas"),
            ),
          ],
        ),
      ),
    );
  }
}
