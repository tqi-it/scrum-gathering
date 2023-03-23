import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mentorme/app/core/domain/entities/contacts.dart';
import 'package:mentorme/app/modules/register/domain/entities/register_entity.dart';
import 'package:mentorme/app/modules/register/presenter/register_controller.dart';
import 'package:mentorme/app/shared/components/mentor_me_button.dart';
import 'package:mentorme/app/shared/components/mentorme_content_page.dart';
import 'package:mentorme/app/shared/components/mentorme_generic_big_app_bar.dart';
import 'package:mentorme/app/shared/theme/images.dart';

class ContactFormField extends StatelessWidget {
  const ContactFormField(
      {super.key, required this.name, required this.image, this.onSaved});

  final String name;
  final AssetImage image;
  final Function(String?)? onSaved;

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
      ),
      onSaved: onSaved,
    );
  }
}

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});
  final controller = Modular.get<RegisterController>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String name = "";
  String bio = "";
  String? linkedIn, whatsapp, telegram, instagram = "";

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
                    }),
                const SizedBox(height: 15),
                TextFormField(
                    decoration: const InputDecoration(hintText: "Bio"),
                    onSaved: (value) {
                      bio = value ?? "";
                    }),
                const SizedBox(height: 15),
                const Text("Contato", textAlign: TextAlign.left),
                ContactFormField(
                  name: "LinkedIn",
                  image: AssetImage(ThemeImages.linkedin),
                  onSaved: (value) {
                    linkedIn = value ?? "";
                  },
                ),
                ContactFormField(
                  name: "Whatsapp",
                  image: AssetImage(ThemeImages.whatsapp),
                  onSaved: (value) {
                    whatsapp = value ?? "";
                  },
                ),
                ContactFormField(
                    name: "Telegram",
                    image: AssetImage(ThemeImages.telegram),
                    onSaved: (value) {
                      telegram = value ?? "";
                    }),
                ContactFormField(
                    name: "Instagram",
                    image: AssetImage(ThemeImages.instagram),
                    onSaved: (value) {
                      instagram = value ?? "";
                    }),
                const SizedBox(height: 15),
                const Text("Habilidades", textAlign: TextAlign.left),
                const SizedBox(height: 15),
                const SizedBox(height: 15),
                MentorMeButton(
                  label: "Cadastrar",
                  isActive: true,
                  height: 50,
                  radius: 6,
                  onPressed: () {
                    final List<Map<String, String>> contacts = [];
                    if (whatsapp != null) {
                      contacts.add({"type": "WHATSAPP", "url": whatsapp ?? ""});
                    }
                    if (linkedIn != null) {
                      contacts.add({"type": "LINKEDIN", "url": linkedIn ?? ""});
                    }
                    if (instagram != null) {
                      contacts
                          .add({"type": "INSTAGRAM", "url": instagram ?? ""});
                    }
                    if (telegram != null) {
                      contacts.add({"type": "TELEGRAM", "url": telegram ?? ""});
                    }
                    _formKey.currentState?.save();
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
