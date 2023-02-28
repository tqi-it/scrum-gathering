from sqlalchemy import Boolean, Column, DateTime, ForeignKey, Integer, String

from database import Base


class Event(Base):
    __tablename__ = "events"

    id = Column(Integer, primary_key=True, index=True)
    name = Column(String, index=True)
    city = Column(String, index=True)
    state = Column(String, index=True)
    date = Column(DateTime, index=True)


class User(Base):
    __tablename__ = "users"

    id = Column(Integer, primary_key=True, index=True)
    name = Column(String, index=True)
    email = Column(String, index=True, unique=True)
    hashedPassword = Column(String, index=True)
