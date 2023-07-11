#!/usr/bin/python3
"""Defines the User class."""
from models.base_model import Base
from models.base_model import BaseModel
from sqlalchemy import Column, String, Integer, Float, DateTime, ForeignKey
from sqlalchemy.orm import relationship
from datetime import datetime

# Define the Orders class
class Order(BaseModel):
    __tablename__ = 'Orders'

    user_id = Column(Integer, ForeignKey('Users.id'), nullable=False)
    order_date = Column(DateTime, nullable=False, default=datetime.now)
    total_amount = Column(Float, nullable=False)
    paid_amount = Column(Float)
    processed = Column(Integer, nullable=False, default=0)
    cancelled = Column(Integer, nullable=False, default=0)

    def __init__(self, *args, **kwargs):
        """initializes user"""
        super().__init__(*args, **kwargs)
