import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:intl/intl.dart';

import 'package:mentorme/main.dart' as app;

import '../test/utils_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  group(
    'end-to-end event test',
    () {
      testWidgets(
        "Should create an event",
        (WidgetTester tester) async {
          app.main();
          const Duration time = Duration(milliseconds: 500);
          final fakeEvent = const GenerateFakeData().generateFakeEventEntity();
          await tester.pumpAndSettle();
          expect(find.text('SCRUM Calendar Events'), findsOneWidget);
          await tester.pumpAndSettle(time);
          await tester.tap(find.byIcon(Icons.add));
          await tester.pumpAndSettle(time);
          await tester.enterText(
              find.byType(TextFormField).at(0), fakeEvent.name);
          await tester.enterText(
              find.byType(TextFormField).at(1), fakeEvent.city);
          await tester.enterText(
              find.byType(TextFormField).at(2), fakeEvent.state);
          await tester.enterText(
              find.byType(TextFormField).at(3), fakeEvent.date.toString());
          await tester.tap(find.byType(ElevatedButton));
          await tester.pumpAndSettle(time);
          expect(find.text("Success!"), findsOneWidget);
          await tester.tap(find.byType(ElevatedButton).last);
          await tester.pumpAndSettle(time);
          await tester.tap(find.byIcon(Icons.home));
          await tester.pumpAndSettle(time);
          expect(find.text(fakeEvent.name), findsOneWidget);
          expect(find.text(fakeEvent.city), findsOneWidget);
          expect(
              find.text(DateFormat('MMM')
                  .format(fakeEvent.date)
                  .toString()
                  .toUpperCase()),
              findsWidgets);
          expect(find.text(fakeEvent.date.day.toString()), findsWidgets);
          await tester.pumpAndSettle(time);
        },
      );

      testWidgets(
        "Should edit an event",
        (WidgetTester tester) async {
          app.main();
          const Duration time = Duration(milliseconds: 500);
          final fakeEvent = const GenerateFakeData().generateFakeEventEntity();
          await tester.pumpAndSettle();
          await tester.tap(find.byIcon(Icons.edit).first);
          await tester.pumpAndSettle(time);
          await tester.enterText(
              find.byType(TextFormField).at(0), fakeEvent.name);
          await tester.enterText(
              find.byType(TextFormField).at(1), fakeEvent.city);
          await tester.enterText(
              find.byType(TextFormField).at(2), fakeEvent.state);
          await tester.enterText(
              find.byType(TextFormField).at(3), fakeEvent.date.toString());
          await tester.tap(find.byType(ElevatedButton).first);
          await tester.pumpAndSettle(time);
          expect(find.text("Success!"), findsOneWidget);
          await tester.tap(find.byType(ElevatedButton).last);
          await tester.pumpAndSettle(time);
          expect(find.text(fakeEvent.name), findsOneWidget);
          expect(find.text(fakeEvent.city), findsOneWidget);
          expect(
              find.text(DateFormat('MMM')
                  .format(fakeEvent.date)
                  .toString()
                  .toUpperCase()),
              findsWidgets);
          expect(find.text(fakeEvent.date.day.toString()), findsWidgets);
          await tester.pumpAndSettle(time);
        },
      );

      testWidgets(
        "Should delete an event",
        (WidgetTester tester) async {
          app.main();

          const Duration time = Duration(milliseconds: 500);
          final fakeEvent = const GenerateFakeData().generateFakeEventEntity();

          await tester.pumpAndSettle(time);
          await tester.tap(find.byIcon(Icons.add));
          await tester.pumpAndSettle(time);
          await tester.enterText(
              find.byType(TextFormField).at(0), fakeEvent.name);
          await tester.enterText(
              find.byType(TextFormField).at(1), fakeEvent.city);
          await tester.enterText(
              find.byType(TextFormField).at(2), fakeEvent.state);
          await tester.enterText(
              find.byType(TextFormField).at(3), fakeEvent.date.toString());
          await tester.tap(find.byType(ElevatedButton));
          await tester.pumpAndSettle(time);
          expect(find.text("Success!"), findsOneWidget);
          await tester.tap(find.byType(ElevatedButton).last);
          await tester.pumpAndSettle(time);
          await tester.tap(find.byIcon(Icons.home));
          await tester.pumpAndSettle(time);
          expect(find.text(fakeEvent.name), findsOneWidget);
          await tester.tap(find.byIcon(Icons.delete_forever).last);
          await tester.pumpAndSettle(time);
          expect(find.text("Success!"), findsOneWidget);
          await tester.tap(find.byType(ElevatedButton).last);
          expect(find.text(fakeEvent.name), findsNothing);
          await tester.pumpAndSettle(time);
        },
      );
    },
  );
}
