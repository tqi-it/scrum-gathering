from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker, declarative_base
import os

if SERVER := os.getenv('DEV_CONTAINERS'):
    SERVER = "database-dev"
else:
    SERVER = "localhost"

SQLACLHEMY_DATABASE_URL = f"postgresql://user:pass@{SERVER}/database"

engine = create_engine(SQLACLHEMY_DATABASE_URL)
SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)

Base = declarative_base()
