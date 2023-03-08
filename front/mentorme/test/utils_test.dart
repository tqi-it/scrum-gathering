import 'package:faker/faker.dart';
import 'package:mentorme/entity/entity_event.dart';

class GenerateFakeData {
  const GenerateFakeData();

  EventEntity generateFakeEventEntity() {
    final fakeState = faker.address.state();
    final fakeEvent = EventEntity(
      id: faker.randomGenerator.integer(100, min: 0),
      name: "SG in $fakeState",
      city: faker.address.city(),
      state: fakeState,
      date: faker.date.dateTime(minYear: 1970, maxYear: 2050),
    );
    return (fakeEvent);
  }
}
