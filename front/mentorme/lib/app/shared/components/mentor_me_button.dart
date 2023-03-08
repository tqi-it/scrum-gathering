import 'package:flutter/material.dart';

class MentorMeButton extends StatelessWidget {
  final Function()? onPressed;
  final String label;
  final double? radius;
  final String? icon;

  const MentorMeButton({Key? key, this.onPressed, required this.label, this.radius, this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed ?? () {},
      child: Container(
          padding: const EdgeInsets.only(top: 5, bottom: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius ?? 50),
            color: Colors.pink,
          ),
          child: Row(
            children: [
              icon != null
                  ? Container(
                      margin: EdgeInsets.only(left: 8),
                      child: Image.asset(
                        icon!,
                        height: 22,
                        width: 22,
                        color: Colors.white,
                      ),
                    )
                  : Container(),
              Expanded(
                child: Text(
                  label,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          )),
    );
  }
}
