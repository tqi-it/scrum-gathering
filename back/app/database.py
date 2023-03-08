from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker, declarative_base
import os

if SERVER := os.getenv('DEV_CONTAINERS'):
    SERVER = "database-dev"
else:
    SERVER = "192.168.0.48"

SQLACLHEMY_DATABASE_URL = f"postgresql://mentorme:mentorme@{SERVER}/database"

engine = create_engine(SQLACLHEMY_DATABASE_URL)
SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)

Base = declarative_base()
