from sqlalchemy.orm import Session

import models
import schemas


def get_person(db: Session, person_id: int):
    return db.query(models.Person).filter(models.Person.id == person_id).first()


def delete_person(db: Session, person_id: int):
    person = db.query(models.Person).filter(models.Person.id == person_id).first()
    db.delete(person)
    db.commit()


def create_person(db: Session, person: schemas.Person):
    db_person = models.Person(
        name=person.name,
        image_url=person.image_url,
        mini_bio=person.mini_bio,
        can_teach=person.can_teach,
        want_to_learn=person.want_to_learn)
    print('crud_person', person)
    db.add(db_person)
    db.commit()
    db.refresh(db_person)
    return db_person


def get_contact(db: Session, contact_id: int):
    return db.query(models.Contact).filter(models.Contact.id == contact_id).first()


def get_person_contacts(db: Session, person_id: int):
    return list(db.query(models.Contact).filter(models.Contact.person_id == person_id))


def create_contact(db: Session, contact: schemas.Contact):
    db.add(contact)
    db.commit()
    db.refresh(contact)
    return contact

def get_skill(db: Session, skill_id: int):
    return db.query(models.Skill).filter(models.Skill.id == skill_id).first()


def get_skills_want_to_learn(db: Session, id_person: int):
    return list(db.query(models.SkillToLearn).filter(models.SkillToLearn.id_person == id_person))


def get_skills_can_teach(db: Session, id_person: int):
    return list(db.query(models.SkillToTeach).filter(models.SkillToLearn.id_person == id_person))


def add_skills(db: Session, id_skill: int, id_person: int):
    skill_to_teach = models.SkillToTeach(id_person=id_person, id_skill=id_skill)
    db.add(skill_to_teach)
    db.commit()
    db.refresh(skill_to_teach)
    return skill_to_teach


def add_interest(db: Session, id_skill: int, id_person: int):
    skill_to_learn = models.SkillToLearn(id_person=id_person, id_skill=id_skill)
    db.add(skill_to_learn)
    db.commit()
    db.refresh(skill_to_learn)
    return skill_to_learn

def update_contact(db: Session, contact: schemas.Contact):
    db_query = db.query(models.Contact).filter(models.Contact.id == contact.id)
    print(contact)
    db_contact = get_contact(db, contact.id)
    db_contact.type = db.query(models.ContactType).filter(models.ContactType.type == contact.type.type)
    db_contact.contact_type_id = db_contact.type.id
    db_contact.value = contact.value
    # contact_dict = {
    #     "id": contact.id,
    #     "contact_type_id": contact.contact_type_id,
    #     "type": {
    #         "id": contact.type.id,
    #         "type": contact.type.type
    #     },
    #     "value": contact.value,
    #     "person_id": contact.person_id
    # }
    db_query.update(db_contact)
    db_contact = db_query.first()
    db.commit()
    db.refresh(db_contact)
    return db_contact


def get_mentors(db: Session):
    return list(db.query(models.Person).filter(models.Person.can_teach == True))


def get_mentoreds(db: Session):
    return list(db.query(models.Person).filter(models.Person.want_to_learn == True))

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
