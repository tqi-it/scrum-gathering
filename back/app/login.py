from sqlalchemy.orm import Session

import schemas
import models


def get_user(db: Session, email: str):
    return db.query(models.User).filter(models.User.email == email).first()


def create_user(db: Session, user: schemas.User):
    db_user = models.User(name=user.name, email=user.email,
                          hashedPassword=user.hashedPassword)
    db.add(db_user)
    db.commit()
    db.refresh(db_user)
    return db_user
