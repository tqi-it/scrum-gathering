import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class MentorMeBigAppBar extends StatelessWidget {
  final Function()? onTap;
  final String pageName;

  const MentorMeBigAppBar({Key? key, this.onTap, required this.pageName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(top: AppBar().preferredSize.height),
      height: 150,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color.fromARGB(204, 10, 125, 184), Color.fromARGB(204, 0, 40, 60)],
        ),
      ),
      child: Column(
        children: [
          Stack(
            children: [
              SizedBox(
                height: 30,
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      ),
                      onPressed: onTap == null
                          ? () {
                              Modular.to.pop();
                            }
                          : onTap!(),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      pageName,
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image(
                width: 103,
                height: 82,
                image: NetworkImage(''),
                fit: BoxFit.fitWidth,
              ),
            ),
          )
        ],
      ),
    );
  }
}
