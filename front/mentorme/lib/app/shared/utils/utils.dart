import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'dart:convert';

import 'package:mentorme/entity/entity_event.dart';

void alertPopup(BuildContext context, String message) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text("Response"),
        content: Text(message),
        actions: [
          ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("close"))
        ],
      );
    },
  );
}

void editPopup(BuildContext context, EventEntity event,
    void Function(String) updateState) {
  final Map<String, TextEditingController> myController = {
    'name': TextEditingController(),
    'city': TextEditingController(),
    'state': TextEditingController(),
    'date': TextEditingController(),
  };

  myController["name"]!.text = event.name;
  myController["city"]!.text = event.city;
  myController["state"]!.text = event.state;
  myController["date"]!.text =
      DateFormat('yyyy-MM-dd').format(event.date).toString();

  final formKey = GlobalKey<FormState>();

  String? validateField(value) {
    if (value!.isEmpty) {
      return 'This field cannot be empty!';
    }
    return null;
  }

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text("Event: ${event.name}"),
        content: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              children: [
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
                      initialDate: event.date,
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2050),
                    );
                    myController['date']!.text =
                        DateFormat('yyyy-MM-dd').format(date!).toString();
                  },
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (formKey.currentState!.validate() == false) {
                      return;
                    }
                    final response = await http.patch(
                      Uri.parse('http://localhost:8000/event'),
                      headers: {'Content-Type': 'application/json'},
                      body: json.encode(
                        {
                          "id": event.id,
                          "name": myController['name']?.text,
                          "city": myController['city']?.text,
                          "state": myController['state']?.text,
                          "date": DateTime.parse(myController['date']!.text)
                              .toString(),
                        },
                      ),
                    );
                    if (response.statusCode == 200) {
                      updateState("Reload");
                      Navigator.pop(context);
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
              ],
            ),
          ),
        ),
        actions: [
          ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("close"))
        ],
      );
    },
  );
}
