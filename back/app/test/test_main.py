from fastapi.testclient import TestClient
from main import app
from .utils import FakeEvent
from datetime import datetime

client = TestClient(app)

def test_create():
    fake_event = FakeEvent()

    print("\nShould create event: ", end="")
    response = client.post("/event", headers={}, json=fake_event.json())
    try:
        assert response.status_code == 200
        assert response.json()["name"] == fake_event.json()["name"]
        assert response.json()["city"] == fake_event.json()["city"]
        assert response.json()["state"] == fake_event.json()["state"]
        assert (
            str(datetime.strptime(response.json()["date"], "%Y-%m-%dT%H:%M:%S"))
            == fake_event.json()["date"]
        )
        print("OK")
    except Exception as error:
        print("KO:", error)

def test_delete():
    fake_event = FakeEvent()

    print("Should delete an event: ", end="")
    response = client.post("/event", json=fake_event.json())
    try:
        assert response.status_code == 200
        id = response.json()["id"]
        assert client.delete(f'/event/{id}').status_code == 200
        assert client.get(f"/event/{id}").status_code == 404
        print("OK")
    except Exception as error:
        print("KO: ", error)

def test_update():
    fake_event = FakeEvent()

    print("Should update an event: ", end="")
    response = client.post("/event", json=fake_event.json())
    try:
        assert response.status_code == 200
        new_data = FakeEvent().json()
        new_data["id"] = response.json()["id"]
        response = client.patch("/event", json=new_data)
        assert response.status_code == 200
        assert response.json()["name"] == new_data["name"]
        assert response.json()["city"] == new_data["city"]
        assert response.json()["state"] == new_data["state"]
        assert (
            str(datetime.strptime(response.json()["date"], "%Y-%m-%dT%H:%M:%S"))
            == new_data["date"]
        )
        print("OK")
    except Exception as error:
        print("KO: ", error)

def test_get_event():
    fake_event = FakeEvent()

    print("Should get an event: ", end="")
    response = client.post("/event", json=fake_event.json())
    try:
        assert response.status_code == 200
        id = response.json()["id"]
        response = client.get(f"/event/{id}")
        assert response.status_code == 200
        assert response.json()["name"] == fake_event.json()["name"]
        assert response.json()["city"] == fake_event.json()["city"]
        assert response.json()["state"] == fake_event.json()["state"]
        assert (
            str(datetime.strptime(response.json()["date"], "%Y-%m-%dT%H:%M:%S"))
            == fake_event.json()["date"]
        )
        print("OK")
    except Exception as error:
        print("KO: ", error)

def test_get_events():
    n = 2
    fake_events = []
    responses = []
    print("Should get all events: ", end="")
    try:
        for i in range(0, n):
            fake_events.append(FakeEvent())
            # response of single event create
            responses.append(client.post("/event", json=fake_events[i].json()))
            assert responses[i].status_code == 200
        # response of /events
        responses_json = [response.json() for response in responses]
        response = client.get("/events")
        for i in range(0, n):
            assert responses_json[i] in response.json()
        assert response.status_code == 200
        print("OK")
    except Exception as error:
        print("KO: ", error)