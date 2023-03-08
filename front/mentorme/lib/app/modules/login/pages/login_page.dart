import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mentorme/app/modules/login/pages/login_controller.dart';
import 'package:mentorme/app/shared/theme/images.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mentorme/app/shared/theme/theme_colors.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final controller = Modular.get<LoginController>();

  @override
  void initState() {
    controller.checkLoggedStatus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: ThemeColors.backgroundLight,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Center(
          child: SvgPicture.asset(
            ThemeImages.appLogo,
          ),
        ),
      ),
    );
  }
}
