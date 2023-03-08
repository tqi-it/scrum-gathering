from sqlalchemy import Boolean, Column, DateTime, ForeignKey, Integer, String
from sqlalchemy.orm import relationship, mapped_column

from database import Base

# class Event(Base):
#     __tablename__ = "events"

#     id = Column(Integer, primary_key=True, index=True)
#     name = Column(String, index=True)
#     city = Column(String, index=True)
#     state = Column(String, index=True)
#     date = Column(DateTime, index=True)


class Person(Base):
    __tablename__ = "person"

    id = Column(Integer, primary_key=True, index=True)
    name = Column(String, index=True)
    image_url = Column(String, index=True)
    mini_bio = Column(String, index=True)
    can_teach = Column(Boolean, index=True)
    want_to_learn = Column(Boolean, index=True)
    contacts = relationship("Contact", back_populates="person")


class Contact(Base):
    __tablename__ = "contact"

    id = Column(Integer, primary_key=True, index=True)

    contact_type_id = Column(Integer, ForeignKey("contact_type.id"))
    type = relationship("ContactType", back_populates="type_item")
    value = Column(String, index=True)

    person_id = Column(Integer, ForeignKey("person.id"))
    person = relationship("Person", back_populates="contacts")


class ContactType(Base):
    __tablename__ = "contact_type"

    id = Column(Integer, primary_key=True, index=True)
    type = Column(String, index=True)
    type_item = relationship("Contact", back_populates="type")


class Skill(Base):
    __tablename__ = "skill"

    id = Column(Integer, primary_key=True, index=True)
    label = Column(String, index=True)
    description = Column(String, index=True)


class SkillToLearn(Base):
    __tablename__ = "skill_to_learn"

    id = Column(Integer, primary_key=True, index=True)
    id_person = Column(Integer, ForeignKey("person.id"))
    id_skill = Column(Integer, ForeignKey("skill.id"))


class SkillToTeach(Base):
    __tablename__ = "skill_to_teach"

    id = Column(Integer, primary_key=True, index=True)
    id_person = Column(Integer, ForeignKey("person.id"))
    id_skill = Column(Integer, ForeignKey("skill.id"))


class ContactHistory(Base):
    __tablename__ = "contact_history"

    id = Column(Integer, primary_key=True, index=True)

    person_id_to = Column(Integer, ForeignKey("person.id"))
    personTo = relationship("Person", back_populates="contacts_history_to")
    person_id_end = Column(Integer, ForeignKey("person.id"))
    personFrom = relationship("Person", back_populates="contacts_history_from")
    contact_type = Column(String)
    contact_value = Column(String)
    request_type = Column(String)
    when = Column(DateTime)

