# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models
from usermanagement.models import *
from patientmanagement.models import *
from appointments.models import DoctorSlots
from datetime import datetime
from appointments.models import *
# Create your models here.
from django.utils import timezone

#
class consultfee(models.Model):
    patient = models.ForeignKey(Patient,on_delete=models.CASCADE)
    doctor = models.ForeignKey(User,on_delete=models.CASCADE)
    amount = models.IntegerField(null=True)
    is_paid=models.BooleanField(default=False)
    generate_date = models.CharField(max_length=300, null=True, blank=True)


class Consultion(models.Model):
    appointment= models.ForeignKey(Appointment,on_delete=models.CASCADE)
    amount = models.IntegerField(null=True)
    is_paid = models.BooleanField(default= False)
    timestamp = models.DateTimeField(default=timezone.now)


class BillGroup(models.Model):
    purpose = [
        (1, "OPD"),
        (2, "LAB"),
        (3, "MED"),
    ]

    group = models.PositiveSmallIntegerField(choices=purpose)

    def __str__(self):
        if self.group==1:
            s="OPD"
        else:
            s="LAB"
        return s

class Bill(models.Model):
    billid = models.SlugField(editable=False, primary_key=True)
    appointment = models.ForeignKey(Appointment,on_delete=models.CASCADE,null=True)
    group = models.ForeignKey(BillGroup,on_delete=models.CASCADE,null=True)
    amount = models.IntegerField(null=True,blank=True)

    def save(self, *args, **kwargs):
        if not self.billid:
            count = Bill.objects.all().count()+1
            count + 1
            group = self.group

            self.billid = "{}-{}-{:06d}".format('LHMR',group, count)
        super(Bill, self).save(*args, **kwargs)