from pydantic import BaseModel
from datetime import datetime


class Event(BaseModel):
    id: int
    name: str
    city: str
    state: str
    date: datetime

    class Config:
        orm_mode = True


class User(BaseModel):
    id: int
    name: str
    email: str
    hashedPassword: str

    class Config:
        orm_mode = True


class UserResponse(BaseModel):
    id: int
    name: str
    email: str

    class Config:
        orm_mode = True
