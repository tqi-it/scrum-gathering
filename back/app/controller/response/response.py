from pydantic import BaseModel


class ContactResponse(BaseModel):
    id: int
    type: str
    value: str


class PersonResponse(BaseModel):
    id: int
    name: str
    image: str
    description: str
    contacts: list[ContactResponse]


