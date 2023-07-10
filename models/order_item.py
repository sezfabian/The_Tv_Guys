#!/usr/bin/python3
"""Defines the User class."""
from models.base_model import Base
from models.base_model import BaseModel
from sqlalchemy import Column, String, Integer, Float, ForeignKey
from sqlalchemy.orm import relationship

class OrderItems(Base):
    __tablename__ = 'Order_items'

    id = Column(Integer, primary_key=True)
    order_id = Column(Integer, ForeignKey('Orders.id'))
    product_id = Column(Integer, ForeignKey('Products.id'))
    quantity = Column(Integer, nullable=False)
    price = Column(Float, nullable=False)
    

    order = relationship('Order', backref='Order_items')

    def __init__(self, *args, **kwargs):
        """initializes user"""
        super().__init__(*args, **kwargs)
