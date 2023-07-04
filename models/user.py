#!/usr/bin/python3
"""Defines the User class."""
from models.base_model import Base
from models.base_model import BaseModel
from sqlalchemy import Column, Integer, String, Date


class User(BaseModel, Base):
    "Defines user for MySQL database"
    __tablename__ = 'Users'

    User_name = Column(String(45), nullable=False)
    User_mail = Column(String(45), nullable=False)
    User_phone = Column(String(15), nullable=False)
    User_address = Column(String(255), nullable=True)
    User_pin = Column(String(255), nullable=True)
    Date_of_birth = Column(Date, nullable=True)
    User_pass = Column(String(45), nullable=False)

    def __init__(self, *args, **kwargs):
        """initializes user"""
        super().__init__(*args, **kwargs)
