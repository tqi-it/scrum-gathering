import 'dart:ui';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:mentorme/app/shared/utils/utils.dart';

class CreateEventPage extends StatefulWidget {
  CreateEventPage({super.key});

  @override
  State<CreateEventPage> createState() => _CreateEventPageState();
}

class _CreateEventPageState extends State<CreateEventPage> {
  final Map<String, TextEditingController> myController = {
    'name': TextEditingController(),
    'city': TextEditingController(),
    'state': TextEditingController(),
    'date': TextEditingController(),
  };

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    String? validateField(value) {
      if (value!.isEmpty) {
        return 'This field cannot be empty!';
      }
      return null;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Create Event"),
      ),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(children: [
            TextFormField(
              validator: validateField,
              controller: myController['name'],
              decoration: const InputDecoration(
                icon: Icon(Icons.person),
                hintText: "Event name",
                labelText: "Name",
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              validator: validateField,
              controller: myController['city'],
              decoration: const InputDecoration(
                icon: Icon(Icons.location_city),
                hintText: "City name",
                labelText: "City",
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              validator: validateField,
              controller: myController['state'],
              decoration: const InputDecoration(
                  icon: Icon(Icons.local_gas_station),
                  hintText: "Event state",
                  labelText: "State"),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              validator: validateField,
              controller: myController['date'],
              decoration: const InputDecoration(
                  icon: Icon(Icons.calendar_today),
                  hintText: "Event date",
                  labelText: "Date"),
              onTap: () async {
                DateTime? date;
                date = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2050),
                );
                myController['date']!.text =
                    DateFormat('yyyy-MM-dd').format(date!).toString();
              },
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () async {
                if (formKey.currentState!.validate() == false) {
                  return;
                }
                final response = await http.post(
                  Uri.parse('http://localhost:8000/event'),
                  headers: {'Content-Type': 'application/json'},
                  body: json.encode(
                    {
                      "id": "0",
                      "name": myController['name']?.text,
                      "city": myController['city']?.text,
                      "state": myController['state']?.text,
                      "date":
                          DateTime.parse(myController['date']!.text).toString(),
                    },
                  ),
                );
                if (response.statusCode == 200) {
                  for (int i = 0; i < myController.length; i += 1) {
                    myController[i]?.text = '';
                  }
                  alertPopup(context, "Success!");
                } else {
                  alertPopup(context, "Failed :(");
                }
              },
              child: const Text('Submit'),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
              ),
            )
          ]),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: "Add",
          ),
        ],
        onTap: (value) {
          if (value == 0) {
            Navigator.pushReplacementNamed(context, "/");
          }
        },
        currentIndex: 1,
        selectedItemColor: Colors.blue,
      ),
    );
  }
}
