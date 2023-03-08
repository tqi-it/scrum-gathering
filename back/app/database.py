from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker, declarative_base
import os

if SERVER := os.getenv('DEV_CONTAINERS'):
    SERVER = "postgres"
else:
    SERVER = "localhost"

SQLACLHEMY_DATABASE_URL = f"postgresql://root:root@{SERVER}/postgres"

engine = create_engine(SQLACLHEMY_DATABASE_URL)
SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)

Base = declarative_base()
