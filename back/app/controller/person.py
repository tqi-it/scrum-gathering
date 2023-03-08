from fastapi import Depends, APIRouter, HTTPException
from sqlalchemy.orm import Session
from database import SessionLocal
import crud

person_router = APIRouter(prefix='/person')


def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()


@person_router.get("/person")
def get_person(id: int, db: Session = Depends(get_db)):
    db_person = crud.get_person(db, id)
    if not db_person:
        raise HTTPException(status_code=404, detail="Person not found")
    return db_person


@person_router.get("/person/{id}")
def get_person(id: int, db: Session = Depends(get_db)):
    db_person = crud.get_person(db, id)
    if not db_person:
        raise HTTPException(status_code=404, detail="Person not found")
    return db_person

