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

@app.get("/event/{id}")
def get_event(id: int, db: Session = Depends(get_db)):
    db_event = crud.get_event(db, id)
    if not db_event:
        raise HTTPException(status_code=404, detail="Event not found")
    return db_event

@app.get("/events")
def get_events(skip: int = 0, limit: int = 100, db: Session = Depends(get_db)):
    db_events = crud.get_events(db, skip=skip, limit=limit)
    return db_events

@app.post("/event", response_model=schemas.Event)
def create_event(event: schemas.Event, db: Session = Depends(get_db)):
    db_event = crud.get_event(db, event.id)
    if db_event:
        raise HTTPException(status_code=400, detail="Event already exists")
    return crud.create_event(db=db, event=event)

@app.patch("/event", response_model=schemas.Event)
def update_event(event: schemas.Event, db: Session = Depends(get_db)):
    db_event = crud.update_event(db, event)
    if not db_event:
        raise HTTPException(status_code=400, detail="Failed to update event")
    return db_event

@app.delete("/event/{id}")
def delete_event(id: int, db: Session = Depends(get_db)):
    return crud.delete_event(db, id)
