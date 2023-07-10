#!/usr/bin/python3
"""Defines the User class."""
from models.base_model import Base
from models.base_model import BaseModel
from sqlalchemy import Column, String, Integer, Float, ForeignKey
from sqlalchemy.orm import relationship


class Product(BaseModel, Base):
    __tablename__ = 'Products'

    id = Column(Integer, primary_key=True)
    Name = Column(String(45), nullable=False)
    Description = Column(String(255))
    Cost = Column(Float, nullable=False)
    Price = Column(Float, nullable=False)
    Brand = Column(String(45))
    Size = Column(String(45))
    Os = Column(String(45))
    Dimensions = Column(String(45))
    Resolution = Column(String(45))
    Warranty = Column(Integer)
    Design = Column(String(45))
    Sub_cat_id = Column(Integer, ForeignKey('Sub_categories.id'))
    Category_id = Column(Integer, ForeignKey('Categories.id'))
    Image = Column(String(255))
    Stock = Column(Integer)


    items = relationship(
        "OrderItems", backref="Products")

    def __init__(self, *args, **kwargs):
        """initializes user"""
        super().__init__(*args, **kwargs)
