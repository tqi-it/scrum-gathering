from fastapi import Depends, APIRouter, HTTPException
from sqlalchemy.orm import Session

from .request.request import ContactRequest, PersonRequest
from .response.response import PersonResponse, ContactResponse

from database import SessionLocal
import crud
import models
import schemas

person_router = APIRouter(prefix='/person')


def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()


@person_router.get("/{id}")
def get_person(id: int, db: Session = Depends(get_db)):
    db_person = crud.get_person(db, id)
    if not db_person:
        raise HTTPException(status_code=404, detail="Person not found")
    db_contacts = crud.get_person_contacts(db, person.id)
    contacts = []
    if db_contacts:
        for contact in db_contacts:
            print('contact', contact.id, contact.type.type, contact.value)
            contacts.append(ContactResponse(id=contact.id, type=contact.type.type, value=contact.value))
    person_response = PersonResponse(id=db_person.id, name=db_person.name, image=db_person.image_url,
                                     description=db_person.mini_bio, contacts=contacts)
    return person_response


@person_router.post("/create")
def create(person: PersonRequest, db: Session = Depends(get_db)):
    print('person', person)
    db_contacts = []
    if person.contacts:
        for contact_request in person.contacts:
            db_contacts.append(models.Contact(contact_type_id=contact_request.id,
                                        type=contact_request.type, value=contact_request.value, person_id=person.id))
    db_person = schemas.Person(
        name=person.name,
        image_url=person.image,
        mini_bio=person.description,
        can_teach=person.can_teach,
        want_to_learn=person.want_learn,
        contracts = db_contacts)
    print('dbperson', db_person)
    created_person = crud.create_person(db_person)
    return get_person(db, created_person.id)


@person_router.get("/delete/{id}")
def delete_person(id: int, db: Session = Depends(get_db)):
    crud.delete_person(db, id)


@person_router.get("/mentors")
def get_mentors(db: Session = Depends(get_db)):
    db_person = crud.get_mentors(db)
    if not db_person:
        raise HTTPException(status_code=404, detail="No mentors could be found")
    mentors = []
    for person in db_person:
        person_response = get_person()
        mentors.append(person_response)
    return mentors


@person_router.get("/mentored")
def get_mentors(db: Session = Depends(get_db)):
    db_person = crud.get_mentoreds(db)
    if not db_person:
        raise HTTPException(status_code=404, detail="No mentored could be found")
    mentors = []
    for person in db_person:
        person_response = get_person()
        mentors.append(person_response)
    return mentors


@person_router.get("/contact")
def create_contact(contact: ContactRequest, db: Session = Depends(get_db)):
    db_person = crud.get_person(db, contact.person_id)
    if not db_person:
        raise HTTPException(status_code=404, detail="Person not found")
    db_contact = models.Contact(contact_type_id=contact.id,
                                    type=contact.type, value=contact.value, person_id=db_person.id)
    crud.create_contact(db, db_contact)
    contact_response = ContactResponse(id=db_contact.id, type=db_contact.type.type, value=db_contact.value)
    return contact_response