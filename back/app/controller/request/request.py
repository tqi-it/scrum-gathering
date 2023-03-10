from pydantic import BaseModel


class ContactTypeRequest(BaseModel):
    id: int
    name: str


class ContactRequest(BaseModel):
    type_id: int
    type: str
    value: str


class PersonRequest(BaseModel):
    name: str
    image: str
    description: str
    can_teach: bool
    want_learn: bool
    contacts: list[ContactRequest]



