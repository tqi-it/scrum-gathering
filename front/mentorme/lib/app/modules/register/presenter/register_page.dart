import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mentorme/app/core/domain/entities/contacts.dart';
import 'package:mentorme/app/modules/register/domain/entities/register_entity.dart';
import 'package:mentorme/app/modules/register/presenter/register_controller.dart';
import 'package:mentorme/app/shared/components/mentor_me_button.dart';
import 'package:mentorme/app/shared/components/mentorme_alert.dart';
import 'package:mentorme/app/shared/components/mentorme_content_page.dart';
import 'package:mentorme/app/shared/components/mentorme_generic_big_app_bar.dart';
import 'package:mentorme/app/shared/theme/images.dart';

class ContactFormField extends StatelessWidget {
  const ContactFormField(
      {super.key,
      this.name,
      required this.image,
      this.onSaved,
      this.prefixIcon,
      this.keyboardType,
      this.inputFormatters});

  final String? name;
  final AssetImage image;
  final Function(String?)? onSaved;
  final Widget? prefixIcon;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: name,
        icon: Image(
          image: image,
          width: 24,
          height: 24,
          color: Colors.grey,
        ),
        prefixIcon: prefixIcon,
        prefixIconConstraints: BoxConstraints(minWidth: 0, minHeight: 0),
      ),
      onSaved: onSaved,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
    );
  }
}

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});
  final controller = Modular.get<RegisterController>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String name = "";
  String bio = "";
  String? linkedIn, whatsapp, telegram, instagram;

  @override
  Widget build(BuildContext context) {
    return MentorMeContentPage(
      appBar: const MentorMeGenericBigAppBar(pageName: "Criar perfil"),
      pageName: "Cadastro",
      child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(hintText: "Nome"),
                  onSaved: (value) {
                    name = value ?? "";
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return ("Esse campo não pode ser vazio!!");
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 15),
                TextFormField(
                  decoration: const InputDecoration(hintText: "Bio"),
                  onSaved: (value) {
                    bio = value ?? "null";
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return ("Esse campo não pode ser vazio!!");
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 15),
                const Text("Contato", textAlign: TextAlign.left),
                ContactFormField(
                  name: "LinkedIn",
                  image: AssetImage(ThemeImages.linkedin),
                  onSaved: (value) {
                    linkedIn = value ?? "";
                  },
                  prefixIcon: Text(
                    "linkedin.com/in/",
                    style: TextStyle(fontSize: 17),
                  ),
                ),
                ContactFormField(
                  name: "Whatsapp",
                  image: AssetImage(ThemeImages.whatsapp),
                  onSaved: (value) {
                    whatsapp = value ?? "";
                  },
                  prefixIcon: Text("+55 ", style: TextStyle(fontSize: 17)),
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                ),
                ContactFormField(
                  name: "Telegram",
                  image: AssetImage(ThemeImages.telegram),
                  onSaved: (value) {
                    telegram = value ?? "";
                  },
                  prefixIcon:
                      Text("telegram.me/", style: TextStyle(fontSize: 17)),
                ),
                ContactFormField(
                  name: "Instagram",
                  image: AssetImage(ThemeImages.instagram),
                  onSaved: (value) {
                    instagram = value ?? "";
                  },
                  prefixIcon: Text("@", style: TextStyle(fontSize: 17)),
                ),
                const SizedBox(height: 15),
                // const Text("Habilidades", textAlign: TextAlign.left),
                const SizedBox(height: 15),
                const SizedBox(height: 15),
                MentorMeButton(
                  label: "Cadastrar",
                  isActive: true,
                  height: 50,
                  radius: 6,
                  onPressed: () {
                    _formKey.currentState?.save();
                    final List<Map<String, String>> contacts = [];
                    if (whatsapp != null && whatsapp!.isNotEmpty) {
                      contacts.add({
                        "type": "WHATSAPP",
                        "url":
                            "https://api.whatsapp.com/send?phone=55$whatsapp&Olá, encontrei seu contato no Mentorme e gostaria de agendar uma mentoria com você. Qual é a sua disponibilidade para falarmos?"
                      });
                    }
                    if (linkedIn != null && linkedIn!.isNotEmpty) {
                      contacts.add({
                        "type": "LINKEDIN",
                        "url": "https://linkedin.com/in/$linkedIn"
                      });
                    }
                    if (instagram != null && instagram!.isNotEmpty) {
                      contacts.add({
                        "type": "INSTAGRAM",
                        "url": "https://instagram.com/$instagram"
                      });
                    }
                    if (telegram != null && telegram!.isNotEmpty) {
                      contacts.add({
                        "type": "TELEGRAM",
                        "url": "https://telegram.me/$telegram"
                      });
                    }
                    if (name.isEmpty || bio.isEmpty) {
                      return (MentorMeAlerts.showInfo(
                        title: "Erro de validação",
                        description: "Nome e Bio não podem ser vazios!",
                        alertHeight: 120,
                      ));
                    }
                    if (contacts.isEmpty) {
                      return (MentorMeAlerts.showInfo(
                        title: "Erro de validação",
                        description: "Adicione pelo menos um contato!",
                      ));
                    }
                    controller.doRegisterMentor(
                      RegisterEntity(
                        id: 0,
                        name: name,
                        description: bio,
                        contacts: contacts,
                        image:
                            "https://i0.wp.com/newspack-washingtoncitypaper.s3.amazonaws.com/uploads/2009/04/contexts.org_socimages_files_2009_04_d_silhouette.png?fit=1200%2C756&ssl=1",
                        canTeach: true,
                        wantToLearn: true,
                      ),
                    );
                    controller.goToHome();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
