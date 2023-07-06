#!/usr/bin/python3
"""Defines the User class."""
from models.base_model import Base
from models.base_model import BaseModel
from sqlalchemy import Column, String
from sqlalchemy.orm import relationship


class Category(BaseModel, Base):
    "Defines user for MySQL database"
    __tablename__ = 'Categories'

    Category_name = Column(String(45), nullable=False)

    sub_categories = relationship(
        "Sub_Category", backref="Categories", cascade="delete")
    products = relationship(
        "Product", backref="Categories")

    def __init__(self, *args, **kwargs):
        """initializes user"""
        super().__init__(*args, **kwargs)
