# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models
from usermanagement.models import Doctors, Patient

class DoctorSlots(models.Model):
    doctor = models.ForeignKey(Doctors,on_delete=models.CASCADE)
    starttime = models.TimeField(null=True,blank=True)
    endtime = models.TimeField(null=True,blank=True)
    consultationfee = models.IntegerField(null=True)
    breakslots = models.TextField(null=True,blank=True)
    appointmnetduration = models.CharField(null=True,blank=True,max_length=100)

class Appointment(models.Model):
    type= [
        (1,"in-patient"),
        (2,"out-patient")
    ]
    state =[
        (0,"closed"),
        (1,"active"),
        (2,"not applicable")
    ]
    patient = models.ForeignKey(Patient,on_delete=models.SET_NULL, null=True,blank=True, related_name="appointments")
    doctor = models.ForeignKey(Doctors,on_delete=models.CASCADE)
    appointmentType = models.PositiveSmallIntegerField(choices=type,default=2)
    flag = models.PositiveSmallIntegerField(choices=state,default=2)
    bookingdate = models.DateField(null=True)
    bookingtime = models.TimeField(null=True)

    def __str__(self):
        return str(self.id)

class BlockSlots(models.Model):
    doctor = models.ForeignKey(Doctors,on_delete=models.CASCADE)
    blockdate = models.DateField(null=True)
    blockslot = models.TimeField(null=True)# -*- coding: utf-8 -*-
