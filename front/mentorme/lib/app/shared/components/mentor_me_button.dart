import 'package:flutter/material.dart';

class MentorMeButton extends StatelessWidget {
  final Function()? onPressed;
  final String label;
  final String? labelInactive;
  final bool isActive;
  final double? radius;
  final String? icon;
  final TextStyle? textStyle;

  const MentorMeButton({Key? key, this.onPressed, required this.label, this.radius, this.icon, this.labelInactive = '', required this.isActive, this.textStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isActive ? onPressed ?? () {} : () {},
      child: Container(
        padding: const EdgeInsets.only(top: 5, bottom: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius ?? 50),
          color: isActive ? Colors.pink : Colors.grey,
        ),
        child: Row(
          children: [
            icon != null
                ? Container(
                    margin: const EdgeInsets.only(left: 8),
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
                isActive ? label : labelInactive ?? '',
                style: textStyle ?? const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
