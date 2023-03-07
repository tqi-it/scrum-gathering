from sqlalchemy.orm import Session
from fastapi import HTTPException, Response, status

import models
import schemas

from datetime import datetime


def get_person(db: Session, person_id: int):
    return db.query(models.Person).filter(models.Person.id == person_id).first()


def create_person(db: Session, person: schemas.Person):
    db_person = models.Person(
        name=person.name,
        image_url=person.image_url, 
        mini_bio=person.mini_bio, 
        can_teach=person.can_teach, 
        want_to_learn=person.want_to_learn)
    db.add(db_person)
    db.commit()
    db.refresh(db_person)
    return (db_person)

def get_contact(db: Session, contact_id: int):
    return db.query(models.Contact).filter(models.Contact.id == contact_id).first()

def create_contact(db: Session, contact: schemas.Contact, person_id: int):
    db_contact_type = db.query(models.ContactType).filter(models.ContactType.type == "whatsapp").first()
    if db_contact_type == None:
        db_contact_type = models.ContactType(type="whatsapp")
        db_contact = models.Contact(contact_type_id=db_contact_type.id,
            type=db_contact_type, value="11999999999", person_id=person_id)
    else:
        db_contact = models.Contact(contact_type_id=db_contact_type.id,
            type=db_contact_type, value="11999999999", person_id=person_id)
    db.add(db_contact)
    db.commit()
    db.refresh(db_contact)
    return db_contact


# def get_event(db: Session, event_id: int):
#     return db.query(models.Event).filter(models.Event.id == event_id).first()

# def get_events(db: Session, skip: int = 0, limit: int = 100):
#     return db.query(models.Event).order_by(models.Event.id.asc()).offset(skip).limit(limit).all()

# def create_event(db: Session, event: schemas.Event):
#     db_event = models.Event(name=event.name, city=event.city,
#                             state=event.state, date=event.date)
#     db.add(db_event)
#     db.commit()
#     db.refresh(db_event)
#     return db_event

# def update_event(db: Session, event: schemas.Event):
#     db_query = db.query(models.Event).filter(models.Event.id == event.id)
#     db_query.update(dict(event))
#     db_event = db_query.first()
#     db.commit()
#     db.refresh(db_event)
#     return db_event

# def delete_event(db: Session, event_id: int):
#     db_query = db.query(models.Event).filter(models.Event.id == event_id)
#     if not db_query.first():
#         raise HTTPException(status_code=404, detail='Event not found')
#     db_query.delete()
#     db.commit()
#     return Response(status_code=status.HTTP_200_OK)
