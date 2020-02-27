# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.shortcuts import render
from rest_framework.generics import RetrieveUpdateDestroyAPIView, CreateAPIView
from .serializers import *
from appointments.models import *
from rest_framework.response import Response
from rest_framework import status
from usermanagement.models import *
from patientmanagement.models import *
from bms.models import *

# Create your views here.

class billgenerate(CreateAPIView):
    serializer_class = billgenerateserializer
    def create(self, request, *args, **kwargs):
        if request.GET["group"]=="lab":
            tests=request.data["testids"]
            testsresults.objects.filter(id__in=tests).update(ispaid=True)
        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        self.perform_create(serializer)
        headers = self.get_success_headers(serializer.data)
        return Response(serializer.data, status=status.HTTP_201_CREATED, headers=headers)





class billgroup(CreateAPIView):
    serializer_class = billgroupserializer



def billsview(request,appointment_id):
    app_id = Appointment.objects.get(id =appointment_id)
    aval = DoctorSlots.objects.get(doctor=app_id.doctor)
    print(app_id.doctor.doc_id,aval.consultationfee)
    uhid = app_id.patient.UHID
    p = Patient.objects.get(UHID=uhid)
    name= p.pat.first_name+p.pat.middle_name+p.pat.last_name
    return render(request, 'bills.html',{"uhid":uhid,"app_id":app_id,"name":name,"doctor":app_id.doctor.doc_id,"opdamount":aval.consultationfee})




def billingview(request,id,billid,group=''):
    rec_id = request.user.id
    recname = User.objects.get(id=rec_id)
    pro = Profile.objects.get(user_id=rec_id)
    recname = pro.first_name+' '+pro.middle_name+' '+pro.last_name
    appoint = Appointment.objects.get(id = id)
    doc =Profile.objects.get(user_id = appoint.doctor_id)
    doctor = Doctors.objects.get(doc_id=appoint.doctor_id)
    name = appoint.patient.pat.first_name + ' ' + appoint.patient.pat.middle_name + ' ' + appoint.patient.pat.last_name
    pataddr = appoint.patient.address + ' ' + appoint.patient.address2
    age = appoint.patient.age
    patid = appoint.patient_id
    bookdate = appoint.bookingdate
    bookdate=bookdate.strftime("%d-%m-%Y")
    booktime = appoint.bookingtime
    booktime=booktime.strftime("%H:%M %p")
    contactno = appoint.patient.emergencycontactno
    billdate = str(date.today())
    docname = doc.first_name + ' ' + doc.middle_name + ' ' + doc.last_name
    pat_id = appoint.patient.pat.id
    docamount = DoctorSlots.objects.filter(doctor_id=doc.user.id).last()
    amount = docamount.consultationfee
    appoint.is_paid = True
    appoint.save()
    return render(request, 'invoice.html',{"appointment":id,'doctor':doctor,'name':name,"bookdate":bookdate,"booktime":booktime,"group":group,"billid":billid,
    'docname':docname,'pataddr':pataddr,'age':age,'contactno': contactno,'patid': patid,'billdate':billdate,"recname":recname,"amount":amount})
