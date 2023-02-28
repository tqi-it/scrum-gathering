from sqlalchemy.orm import Session
from fastapi import HTTPException, Response, status

import models, schemas

from datetime import datetime

def get_event(db: Session, event_id: int):
    return db.query(models.Event).filter(models.Event.id == event_id).first()

def get_events(db: Session, skip: int = 0, limit: int = 100):
    return db.query(models.Event).order_by(models.Event.id.asc()).offset(skip).limit(limit).all()

def create_event(db: Session, event: schemas.Event):
    db_event = models.Event(name=event.name, city=event.city,
                            state=event.state, date=event.date)
    db.add(db_event)
    db.commit()
    db.refresh(db_event)
    return db_event

def update_event(db: Session, event: schemas.Event):
    db_query = db.query(models.Event).filter(models.Event.id == event.id)
    db_query.update(dict(event))
    db_event = db_query.first()
    db.commit()
    db.refresh(db_event)
    return db_event

def delete_event(db: Session, event_id: int):
    db_query = db.query(models.Event).filter(models.Event.id == event_id)
    if not db_query.first():
        raise HTTPException(status_code=404, detail='Event not found')
    db_query.delete()
    db.commit()
    return Response(status_code=status.HTTP_200_OK)
