import 'package:flutter/material.dart';
import 'package:mentorme/app/shared/components/mentor_me_button.dart';
import 'package:mentorme/app/shared/components/mentorme_big_app_bar.dart';
import 'package:mentorme/app/shared/components/mentorme_content_page.dart';
import 'package:mentorme/app/shared/components/mentorme_generic_big_app_bar.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MentorMeContentPage(
      appBar: const MentorMeGenericBigAppBar(pageName: "Criar perfil"),
      pageName: "Cadastro",
      child: Form(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              TextFormField(
                  decoration: const InputDecoration(hintText: "Nome")),
              const SizedBox(height: 15),
              TextFormField(decoration: const InputDecoration(hintText: "Bio")),
              const SizedBox(height: 15),
              TextFormField(
                  decoration: const InputDecoration(hintText: "Contato")),
              const SizedBox(height: 15),
              const MentorMeButton(
                label: "Cadastrar",
                isActive: true,
                height: 50,
                radius: 6,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
