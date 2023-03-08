import 'package:mentorme/entity/entity_event.dart';
import 'package:test/test.dart';

import 'utils_test.dart';

void main() {
  test(
    'EventEntity() should create a EventEntity instance',
    () {
      final fakeEvent = const GenerateFakeData().generateFakeEventEntity();
      final event = EventEntity(
          id: fakeEvent.id,
          name: fakeEvent.name,
          city: fakeEvent.city,
          state: fakeEvent.state,
          date: fakeEvent.date);
      expect(event.id, fakeEvent.id);
      expect(event.name, fakeEvent.name);
      expect(event.city, fakeEvent.city);
      expect(event.state, fakeEvent.state);
      expect(event.date, fakeEvent.date);
    },
  );
}
