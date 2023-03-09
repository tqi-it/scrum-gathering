from fastapi import Depends, FastAPI, HTTPException, APIRouter
from fastapi.middleware.cors import CORSMiddleware
from sqlalchemy.orm import Session

import crud
import models
import schemas
from database import SessionLocal, engine

from controller.person import person_router

from controller.request.request import ContactTypeRequest

models.Base.metadata.create_all(bind=engine)

app = FastAPI()
router = APIRouter()

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)


def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()


app.include_router(person_router)


@app.post("/person")
def create_person(person: schemas.Person, db: Session = Depends(get_db)):
    print('person_create', person)
    db_person = crud.get_person(db, person.id)
    if db_person:
        raise HTTPException(status_code=400, detail="Person already exists")
    db_person = crud.create_person(db, person)
    return db_person

@app.get("/contact/{id}")
def get_contact(id: int, db: Session = Depends(get_db)):
    db_contact = crud.get_contact(db, id)
    if not db_contact:
        raise HTTPException(status_code=404, detail="Contact not found")
    return db_contact


@app.patch("/contact")
def update_contact(contact: schemas.Contact, db: Session = Depends(get_db)):
    db_contact = crud.get_contact(db, contact.id)
    if not db_contact:
        raise HTTPException(status_code=404, detail="Contact not found")
    if contact.person_id != db_contact.person_id:
        raise HTTPException(status_code=403, detail="Access forbidden")
    db_contact = crud.update_contact(db, contact)
    return db_contact


@app.post("/add_skill")
def add_skill(skill_id: int, person_id: int, db: Session = Depends(get_db)):
    db_person = crud.get_person(db, person_id)
    if not db_person:
        raise HTTPException(status_code=404, detail="Person not found")
    db_skill = crud.get_skill(db, skill_id)
    if not db_skill:
        raise HTTPException(status_code=404, detail="Skill not found")
    db_skills = crud.add_skills(db, skill_id, person_id)
    return db_skills


@app.post("/add_interest")
def add_interest(skill_id: int, person_id: int, db: Session = Depends(get_db)):
    db_person = crud.get_person(db, person_id)
    if not db_person:
        raise HTTPException(status_code=404, detail="Person not found")
    db_skill = crud.get_skill(db, skill_id)
    if not db_skill:
        raise HTTPException(status_code=404, detail="Skill of interest not found")
    db_interest = crud.add_interest(db, skill_id, person_id)
    return db_interest


@app.get("/get_skills")
def get_skills( person_id: int, db: Session = Depends(get_db)):
    db_person = crud.get_person(db, person_id)
    if not db_person:
        raise HTTPException(status_code=404, detail="Person not found")
    db_skills = crud.get_skills_can_teach(db, person_id)
    if not db_skills:
        raise HTTPException(status_code=404, detail="Person has no skills to teach")
    return db_skills


@app.get("/get_interests")
def get_interests( person_id: int, db: Session = Depends(get_db)):
    db_person = crud.get_person(db, person_id)
    if not db_person:
        raise HTTPException(status_code=404, detail="Person not found")
    db_interests = crud.get_skills_want_to_learn(db, person_id)
    if not db_interests:
        raise HTTPException(status_code=404, detail="Person has no interests")
    return db_interests


@app.post("/contact_type")
def contact_type(contact_type_request : ContactTypeRequest, db: Session = Depends(get_db)):
    crud.create_contact_type(db, contact_type_request)


# @app.get("/event/{id}")
# def get_event(id: int, db: Session = Depends(get_db)):
#     db_event = crud.get_event(db, id)
#     if not db_event:
#         raise HTTPException(status_code=404, detail="Event not found")
#     return db_event

# @app.get("/events")
# def get_events(skip: int = 0, limit: int = 100, db: Session = Depends(get_db)):
#     db_events = crud.get_events(db, skip=skip, limit=limit)
#     return db_events

# @app.post("/event", response_model=schemas.Event)
# def create_event(event: schemas.Event, db: Session = Depends(get_db)):
#     db_event = crud.get_event(db, event.id)
#     if db_event:
#         raise HTTPException(status_code=400, detail="Event already exists")
#     return crud.create_event(db=db, event=event)

# @app.patch("/event", response_model=schemas.Event)
# def update_event(event: schemas.Event, db: Session = Depends(get_db)):
#     db_event = crud.update_event(db, event)
#     if not db_event:
#         raise HTTPException(status_code=400, detail="Failed to update event")
#     return db_event

# @app.delete("/event/{id}")
# def delete_event(id: int, db: Session = Depends(get_db)):
#     return crud.delete_event(db, id)

@app.get("/health")
def health():
    return "ok"

