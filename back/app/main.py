from fastapi import FastAPI, Depends, HTTPException
from fastapi import Depends, FastAPI, HTTPException
from fastapi.middleware.cors import CORSMiddleware
from sqlalchemy.orm import Session

import crud, models, schemas
from database import SessionLocal, engine

models.Base.metadata.create_all(bind=engine)

app = FastAPI()

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

@app.get("/person/{id}")
def get_person(id: int, db: Session = Depends(get_db)):
    db_person = crud.get_person(db, id)
    if not db_person:
        raise HTTPException(status_code=404, detail="Person not found")
    return db_person


@app.post("/person")
def create_person(person: schemas.Person, db: Session = Depends(get_db)):
    db_person = crud.get_person(db, person.id)
    if db_person:
        raise HTTPException(status_code=400, detail="Person already exists")
    db_person = crud.create_person(db, person)
    return db_person


@app.get("/person/contact/{id}")
def get_contact(id: int, db: Session = Depends(get_db)):
    db_contact = crud.get_contact(db, id)
    if not db_contact:
        raise HTTPException(status_code=404, detail="Contact not found")
    return db_contact

@app.post("/contact")
def create_contact(contact: schemas.Contact, person_id: int, db: Session = Depends(get_db)):
    db_person = crud.get_person(db, person_id)
    if not db_person:
        raise HTTPException(status_code=404, detail="Person not found")
    db_contact = crud.create_contact(db, contact, person_id=person_id)
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


@app.get("/mentors")
def get_mentors(db: Session = Depends(get_db)):
    db_person = crud.get_mentors(db)
    if not db_person:
        raise HTTPException(status_code=404, detail="No mentors could be found")
    return db_person


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
