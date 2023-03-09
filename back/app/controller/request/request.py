from pydantic import BaseModel


class ContactRequest(BaseModel):
    type: str
    value: str


class PersonRequest(BaseModel):
    name: str
    image: str
    description: str
    can_teach: bool
    want_learn: bool
    contacts: list[ContactRequest]



