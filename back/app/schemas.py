from pydantic import BaseModel
from datetime import datetime

# class Event(BaseModel):
#     id: int
#     name: str
#     city: str
#     state: str
#     date: datetime

#     class Config:
#         orm_mode = True

class ContactType(BaseModel):
    id: int
    type: str

    class Config:
         orm_mode = True

class Contact(BaseModel):
    id: int
    contact_type_id: int
    type: ContactType
    value: str
    person_id: int

    class Config:
         orm_mode = True

class Person(BaseModel):
    id: int
    name: str
    mini_bio: str
    can_teach: bool
    want_to_teach: bool
    contacts: Contact

    class Config:
         orm_mode = True