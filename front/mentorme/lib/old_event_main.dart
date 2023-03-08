import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:mentorme/entity/entity_event.dart';
import 'package:mentorme/pages/page_create_event.dart';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';
import 'package:mentorme/app/shared/components/widget_event.dart';

Future<List<EventEntity>> fetchEvent() async {
  final response = await http.get(Uri.parse('http://localhost:8000/events'));
  final json = jsonDecode(response.body);
  final List<EventEntity> list = [];
  for (var data in json) {
    list.add(
      EventEntity(
        id: data["id"],
        name: data["name"],
        city: data["city"],
        state: data["state"],
        date: DateTime.parse(data["date"]),
      ),
    );
  }

  if (response.statusCode == 200) {
    return list;
  } else {
    throw Exception("Failed to get event");
  }
}

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SC Calendar',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: GoogleFonts.roboto().fontFamily,
          colorScheme: const ColorScheme(
            brightness: Brightness.light,
            primary: Color(0xFFD9385E),
            onPrimary: Colors.white,
            secondary: Colors.yellow,
            onSecondary: Colors.black,
            error: Colors.red,
            onError: Colors.red,
            background: Colors.teal,
            onBackground: Colors.white,
            surface: Colors.orange,
            onSurface: Colors.black,
          )),
      initialRoute: "/",
      routes: {
        "/": (context) => MyHomePage(title: 'SCRUM Calendar Events'),
        "/create_event": (context) => CreateEventPage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
        child: FutureBuilder(
          future: fetchEvent(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, i) => EventWidget(
                  event: EventEntity(
                    id: snapshot.data![i].id,
                    name: snapshot.data![i].name,
                    city: snapshot.data![i].city,
                    state: snapshot.data![i].state,
                    date: snapshot.data![i].date,
                  ),
                  updateState: (String message) {
                    setState(() {});
                  },
                ),
              );
            } else {
              return Container();
            }
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Add',
          ),
        ],
        onTap: (value) {
          if (value == 1) {
            Navigator.pushNamed(context, "/create_event");
          }
        },
        currentIndex: 0,
        selectedItemColor: Colors.blue,
      ),
    );
  }
}
