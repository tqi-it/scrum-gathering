from pydantic import BaseModel

class PersonRequest(BaseModel):
    pass
    

class ContactRequest(BaseModel):
    person_id: int
    type: str
    url: str

class ContactHistoryRequest(BaseModel):
    person_id: int
    