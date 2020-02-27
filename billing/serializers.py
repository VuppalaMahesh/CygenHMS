# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from rest_framework.serializers import ModelSerializer
from .models import *
from datetime import datetime,date,time

class billgroupserializer(ModelSerializer):
    class Meta:
        model = BillGroup
        fields = '__all__'


class billgenerateserializer(ModelSerializer):
    class Meta:
        model = Bill
        fields = '__all__'