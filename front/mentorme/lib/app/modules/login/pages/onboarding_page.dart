import 'package:flutter/material.dart';
import 'package:mentorme/app/modules/login/pages/login_controller.dart';

import '../../../shared/theme/images.dart';
import '../../home/presenter/home_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final controller = Modular.get<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF0A7DB8), Color(0xFF00283C)],
          ),
        ),
        child: Column(
          children: [
            Expanded(
              flex: 70,
              child: Image(
                width: 307,
                height: 349,
                image: AssetImage(ThemeImages.onboarding),
                fit: BoxFit.fitWidth,
              ),
            ),
            Expanded(
                flex: 12,
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 24),
                  alignment: Alignment.bottomCenter,
                  child: const Text(
                    "Encontre alguém para mentorar você",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.white,
                    ),
                  ),
                )),
            Expanded(
              flex: 18,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      controller.goToRegister();
                    },
                    child: const Text(
                      "Iniciar",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
