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
    image_url: str
    mini_bio: str
    can_teach: bool
    want_to_learn: bool
    contacts: Contact|None

    class Config:
         orm_mode = True


class Skill(BaseModel):
    id: int
    name: str
    description: str


class SkillToLearn(BaseModel):
    id = int
    id_person = int
    id_skill = int


class SkillToTeach(BaseModel):
    id = int
    id_person = int
    id_skill = int


class ContactHistory(BaseModel):
    id: int
    person_to: Person
    person_from: Person
    contact_type: str
    contact_value: str
    when: datetime
    request_type: str

    class Config:
         orm_mode = True

