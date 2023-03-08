import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mentorme/main.dart';
import 'package:mentorme/widgets/widget_event.dart';

import 'utils_test.dart';

void main() {
  testWidgets('Owr great WILLDGET', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    // Build our app and trigger a frame.
    // final fakeEvent = const GenerateFakeData().generateFakeEventEntity();
    // await tester.pumpWidget(
    //   MaterialApp(
    //       home: Scaffold(
    //           body: EventWidget(
    //     event: fakeEvent,
    //     updateState: (String message) {
    //       setState(() {});
    //     },
    //   ))),
    // );

    // Verify texts
    // expect(find.text(fakeEvent.id.toString()), findsOneWidget);
    // expect(find.text(fakeEvent.name), findsOneWidget);
    // expect(find.text(fakeEvent.city), findsOneWidget);
    // expect(find.text(fakeEvent.state), findsOneWidget);
    // expect(find.text(fakeEvent.date.toString()), findsOneWidget);
    // expect(find.text('fake text'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();
  });
}

void setState(Null Function() param0) {}
