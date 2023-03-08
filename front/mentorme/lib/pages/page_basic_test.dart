import 'package:flutter/material.dart';
import 'package:mentorme/app/core/domain/entities/mentor_entity.dart';
import 'package:mentorme/app/shared/components/widget_mentor_card.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<MentorEntity>> fetchMentor() async {
  final response = await http.get(
      Uri.parse('https://private-97460f-mentorme.apiary-mock.com/mentors'));
  final json = jsonDecode(response.body);
  final List<MentorEntity> list = [];
  print(json);
  for (var data in json) {
    list.add(
      MentorEntity(
          phoneNumber: data["phoneNumber"],
          name: data["name"],
          id: data["id"],
          skill: "",
          profile: "#",
          imageProfile: data["image"],
          availability: "",
          description: data["description"],
          slots: 0,
          likes: 0,
          rate: 0, contacts: []),
    );
  }
  print("Passou");

  if (response.statusCode == 200) {
    print("OK!");
    return list;
  } else {
    print("NOT OK!");
    throw Exception("Failed to get mentor");
  }
}

class BasicTestPage extends StatefulWidget {
  BasicTestPage({super.key, required this.title});
  final String title;

  @override
  State<BasicTestPage> createState() => _BasicTestPageState();
}

class _BasicTestPageState extends State<BasicTestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromARGB(204, 10, 125, 184),
                Color.fromARGB(204, 0, 40, 60)
              ],
            ),
          ),
        ),
      ),
      body: Container(
        color: Color(0xFFEBF0FF),
        child: FutureBuilder(
          future: fetchMentor(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              print("builder!");
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, i) => MentorCardWidget(
                  mentor: MentorEntity(
                      name: snapshot.data![i].name,
                      id: snapshot.data![i].id,
                      phoneNumber: snapshot.data![i].phoneNumber,
                      skill: "",
                      profile: "#",
                      imageProfile: snapshot.data![i].imageProfile,
                      availability: "",
                      description: snapshot.data![i].description,
                      slots: 0,
                      likes: 0,
                      rate: 0, contacts: []),
                ),
              );
            } else {
              print("fuck");
              return Container();
            }
          },
        ),
      ),
    );
  }
}
