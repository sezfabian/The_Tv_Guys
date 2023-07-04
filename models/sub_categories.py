#!/usr/bin/python3
"""Defines the Sub_Category class."""
from models.base_model import Base
from models.base_model import BaseModel
from sqlalchemy import Column, String, Integer, ForeignKey
from sqlalchemy.orm import relationship


class Sub_Category(BaseModel, Base):
    "Defines Sub_Category for MySQL database"
    __tablename__ = 'Sub_categories'

    Sub_cat_name = Column(String(45), nullable=False)
    Category_id = Column(Integer, ForeignKey("Categories.id"), nullable=False)

    products = relationship(
        "Product", backref="Sub_categories")

    def __init__(self, *args, **kwargs):
        """initializes user"""
        super().__init__(*args, **kwargs)
