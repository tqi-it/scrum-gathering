import 'package:flutter/material.dart';
import 'package:mentorme/entity/entity_event.dart';
import 'package:mentorme/app/shared/components/widget_event_date.dart';
import 'package:mentorme/app//shared/utils/utils.dart';
import 'package:http/http.dart' as http;

typedef void VoidCallback(String message);

class EventWidget extends StatelessWidget {
  final VoidCallback updateState;
  final EventEntity event;

  const EventWidget(
      {super.key, required this.event, required this.updateState});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      width: 450,
      height: 160,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                onPressed: () {
                  editPopup(
                    context,
                    event,
                    updateState,
                  );
                },
                icon: const Icon(Icons.edit),
                iconSize: 25,
                splashRadius: 15,
                color: Color.fromARGB(255, 6, 167, 19),
              ),
              IconButton(
                onPressed: () async {
                  final response = await http.delete(
                      Uri.parse("http://localhost:8000/event/${event.id}"));
                  updateState("Reload");
                  if (response.statusCode == 200) {
                    alertPopup(context, "Success!");
                  } else {
                    alertPopup(context, "Failed :(");
                  }
                },
                icon: const Icon(Icons.delete_forever),
                iconSize: 25,
                splashRadius: 15,
                color: Color.fromARGB(255, 209, 4, 4),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 2.0, color: Colors.black),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Text(
                              event.name,
                              style: const TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              event.city,
                              style: const TextStyle(
                                fontSize: 25,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [EventDate(date: event.date)],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
