# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from rest_framework.serializers import ModelSerializer
from .models import *
# from .models import User,Usertypes,Userorganisation,Patientpersonalinfo,Patientcontactinfo,Patientprofiledetails,Alternatecontact,File,Staffaddress,\
#     Staffdemograpic,Staffspeciality
from rest_framework import serializers
from usermanagement.tasks import send_password_sms, \
    send_password_email  # send_verification_email,send_restpassword_email,send_wellcom_email,send_restsussuss_email,send_wellcom_sms,send_bulkhealthtipsemail
from django.contrib.auth.hashers import make_password
from django.template.loader import render_to_string
import string
from datetime import datetime, date
from dateutil.relativedelta import *
from rest_framework.utils import model_meta
from billing.models import *


class DoctorSlotsserializer(ModelSerializer):
    class Meta:
        model = DoctorSlots
        fields = "__all__"

class doctorgetserializer(ModelSerializer):
    class Meta:
        model = DoctorSlots
        fields = ("id","starttime","endtime","appointmnetduration","doctor","consultationfee")

    def update(self, instance, validated_data):
        #print "dess", instance
        info = model_meta.get_field_info(instance)

        for attr, value in validated_data.items():
            if attr in info.relations and info.relations[attr].to_many:
                field = getattr(instance, attr)
                # print field
                field.set(value)
            else:
                setattr(instance, attr, value)

        instance.save()

        return instance


class appointmentserializer(ModelSerializer):
    # standardchoices = choicesserializer(read_only=True)
    doctor = serializers.CharField()
    def get_doctor(self,obj):
        return '{}'.format(obj.doctor.pro.first_name+' '+obj.doctor.pro.middle_name+' '+obj.doctor.pro.last_name)
    class Meta:
        model = Appointment
        fields = "__all__"

class appointmenttimeserializer(ModelSerializer):
    class Meta:
        model = Appointment
        fields = "__all__"
#billing

class consultfeebill(ModelSerializer):
    class Meta:
        model = Consultion
        fields = "__all__"


class consultfeebillget(ModelSerializer):
    class Meta:
        model = consultfee
        fields = '__all__'

class blockslotserializer(ModelSerializer):
    class Meta:
        model = BlockSlots
        fields = '__all__'