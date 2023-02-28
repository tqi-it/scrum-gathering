import schemas
import random
from datetime import datetime


class FakeEvent:
    def __init__(self):
        self.event = schemas.Event(
            id=0,
            name="SG in SP",
            city="São Paulo",
            state="São Paulo",
            date=datetime(
                year=2030,
                month=random.randint(1, 12),
                day=random.randint(1, 28),
            ),
        )

    def json(self) -> dict:
        return {
            "id": self.event.id,
            "name": self.event.name,
            "city": self.event.city,
            "state": self.event.state,
            "date": str(self.event.date),
        }

    def __str__(self):
        model = f"\nname: {self.event.name}\ncity: {self.event.city}\nstate: {self.event.state}\ndate: {self.event.date}"
        return model
