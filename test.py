#!/usr/bin/python3
from models.base_model import BaseModel
from models.user import User
from models.category import Category
from models.sub_categories import Sub_Category
from models import storage
storage.reload()
Tvs = Sub_Category('TV Deinstallation', 4)
storage.new(Tvs)
storage.save()
dan = BaseModel()

o = storage.all('Sub_Category')
print(o)
