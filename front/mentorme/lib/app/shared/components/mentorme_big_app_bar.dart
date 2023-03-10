import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mentorme/app/core/domain/entities/mentor_entity.dart';

class MentorMeBigAppBar extends StatelessWidget {
  final Function()? onTap;
  final String pageName;
  final MentorEntity mentor;

  const MentorMeBigAppBar({Key? key, this.onTap, required this.pageName, required this.mentor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 18),
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(top: AppBar().preferredSize.height),
      height: 173,
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
            child: ClipOval(
              child: Image(
                width: 70,
                image: NetworkImage(mentor.imageProfile),
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          const SizedBox(height:  5),
          Text(mentor.name,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white,)),
          const SizedBox(height: 19)
        ],
      ),
    );
  }
}
