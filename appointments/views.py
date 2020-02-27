# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from django.forms.models import model_to_dict
from django.shortcuts import render
from usermanagement.models import User,Patient,Profile
from rest_framework.response import Response
from .serializers import *
from rest_framework import status
from rest_framework.decorators import api_view
from billing.modelref import get_model
from rest_framework.generics import RetrieveUpdateDestroyAPIView, CreateAPIView, ListAPIView,UpdateAPIView,mixins,GenericAPIView,RetrieveAPIView,DestroyAPIView
from dateutil.relativedelta import relativedelta
from datetime import datetime,time,timedelta
from django.utils.encoding import smart_bytes
from django.http import JsonResponse
import json
from billing.models import consultfee
from django.http import HttpResponse
from django.views.generic import View
from .utils import render_to_pdf

class update_patient_appointment(RetrieveUpdateDestroyAPIView):
    #print 'kkkkkkkkkkk'
    lookup_field = "doctor_id"
    serializer_class = appointmentserializer

def generateslots(duration,starttime,endtime,breakslots):

    lis =[]
    st, et = starttime,endtime
    st = timedelta(hours=st.hour, minutes=st.minute, seconds=st.second)
    startime = st
    et = timedelta(hours=et.hour, minutes=et.minute, seconds=et.second)

    du = timedelta(minutes=int(duration))
    timeslot = str(et - st)
    li = timeslot.split(':')
    if breakslots:
        if str(st) not in breakslots:
            listime = str(st).split(":")
            h = "{0:0=2d}".format(int(listime[0]))
            listime.remove(listime[0])
            listime.insert(0,h)
            strtime = ":".join(listime)
            lis.append(str(strtime))
    else:
        listime = str(st).split(":")
        h = "{0:0=2d}".format(int(listime[0]))
        listime.remove(listime[0])
        listime.insert(0,h)
        strtime = ":".join(listime)
        lis.append(str(strtime))
    for i in range((int(li[0]) * 60 + int(li[1]) + int(li[2])) // int(duration)-1):
        if startime == et:
            break
        else:
            st = st + du
            listime = str(st).split(":")
            h = "{0:0=2d}".format(int(listime[0]))
            listime.remove(listime[0])
            listime.insert(0,h)
            strtime = ":".join(listime)
            if breakslots :
                liss =breakslots.split(',')
                if str(strtime) in breakslots.split(','):
                    continue
            s = str(st).split(':')
            lis.append(str(strtime))
    slots = lis
    slots = ",".join(slots)
    return slots

def slotsminise(book_date,book_time,sl_cho):
    v = book_time
    ty = v.split(":")
    sl = sl_cho.split(",")
    dy = datetime.strptime(book_date, '%Y-%m-%d')
    year = dy.strftime("%Y")
    month = dy.strftime("%m")
    day = dy.strftime("%d")
    date1 = datetime(int(year), int(month), int(day), int(ty[0]), int(ty[1]))
    for i in sl:
        v = i
        time2 = v.split(":")
        d2 = eval('datetime' + "({0},{1},{2},{3},{4})".format(int(year), int(month), int(day), int(time2[0]), int(time2[1])))
        if d2 == date1:
            sl.remove(i)
    slotchoices = ",".join(sl)
    return slotchoices

class appointmentslot(CreateAPIView):
    serializer_class = appointmenttimeserializer
    queryset =Appointment.objects.all()


class appointmentslotsget(ListAPIView):
    lookup_field = 'id'
    lookup_url_kwarg = "doctor_link"
    serializer_class = appointmentserializer
    queryset = Appointment.objects.all()

class DoctorSlotspost(CreateAPIView):
    serializer_class = DoctorSlotsserializer

class DoctorSlotsget(RetrieveUpdateDestroyAPIView):
    lookup_field = 'id'
    serializer_class = doctorgetserializer
    queryset = DoctorSlots.objects.all()

class appointment(RetrieveAPIView):
    lookup_field = "doctor_id"
    serializer_class = appointmentserializer

    def get_queryset(self,request):
        doctor = self.kwargs.get(self.lookup_field)
        queryset = Appointment.objects.filter(doctor=doctor,bookingdate =request.data["bookingdate"])
        return queryset
    def get(self, request, *args, **kwargs):
        #print 'eee'
        queryset = self.get_queryset(request)
        #print queryset
        page = self.paginate_queryset(queryset)
        if page is not None:
            serializer = self.get_serializer(page, many=True)
            return self.get_paginated_response(serializer.data)
        serializer = self.get_serializer(queryset, many=True)
        return Response(serializer.data)

def getappoints(request,doctor_id):
    doctor =doctor_id
    bookdate = request.GET["bookingdate"]

    slots= {}
    slotlis =[]
    blocklist =[]
    queryset = Appointment.objects.filter(doctor_id=doctor, bookingdate=bookdate)
    blockquery =BlockSlots.objects.filter(doctor_id=doctor, blockdate=bookdate)
    for i in queryset:
        slotlis.append(str(i.bookingtime))
    for j in blockquery:
        blocklist.append(str(j.blockslot))
    print(slotlis)
    slots["bookedslots"]=slotlis
    slots["blockedslots"]=blocklist
    slotlis=','.join(slotlis)
    obj = DoctorSlots.objects.filter(doctor_id=doctor).last()
    if slotlis and obj and blocklist:
        minslots = slotlis+','+','+','.join(blocklist)+','+obj.breakslots
        s = generateslots(obj.appointmnetduration, obj.starttime, obj.endtime, minslots)
        slots["slots"] = list(s.split(','))

    elif slotlis and obj:
        print(obj.breakslots)
        minslots =  slotlis+','+obj.breakslots
        s = generateslots(obj.appointmnetduration, obj.starttime, obj.endtime, minslots)
        slots["slots"] = list(s.split(','))
    elif blocklist and obj:
        minslots =  ','.join(blocklist)+','+obj.breakslots
        s = generateslots(obj.appointmnetduration, obj.starttime, obj.endtime, minslots)
        slots["slots"] = list(s.split(','))
    elif obj:
        minslots =  obj.breakslots
        s = generateslots(obj.appointmnetduration, obj.starttime, obj.endtime, minslots)
        slots["slots"] = list(s.split(','))
    else:
        minslots=None
        slots["slots"] = []
    
    return JsonResponse(slots)

class get_all_appointment(ListAPIView):
    lookup_field = "doctor_id"
    serializer_class = appointmentserializer
    queryset = Appointment.objects.all()


# class choicesview(RetrieveUpdateDestroyAPIView):
#     lookup_field = "id"
#     serializer_class = choicesserializer
#     queryset = Choices.objects.all()

class appointmentchoices(ListAPIView,DestroyAPIView):
    lookup_field = "doctor_id"
    # lookup_url_kwarg = "patient_code"
    serializer_class = appointmentserializer
    queryset = Appointment.objects.all()
    def get(self, request, *args, **kwargs):
        date = request.GET.get("bookingdate")
        time = request.GET.get("bookingtime")
        query = self.queryset.filter(doctor=self.kwargs["doctor_id"],bookingdate=date,bookingtime=time)
        self.queryset=query
        #print self.queryset
        # d = model_to_dict(query)
        # get_querystring_params(d,Appointment)
        return self.list(request, *args, **kwargs)
    def delete(self, request, *args, **kwargs):
        date = request.GET.get("bookingdate")
        time = request.GET.get("bookingtime")
        ##print date, time, self.kwargs["doctor_id"]
        # d= self.lookup_field
        query = self.queryset.filter(doctor=self.kwargs["doctor_id"], bookingdate=date, bookingtime=time)
        self.queryset = query
        ##print self.queryset
        return self.destroy(request, *args, **kwargs)

    def destroy(self, request, *args, **kwargs):
        instance = self.get_object()
        data ={"patient_id":instance.patient.UHID}
        self.perform_destroy(instance)
        ##print data
        return JsonResponse(data)


class getappointtime(ListAPIView):
    lookup_field = "patient_id"
    serializer_class = appointmenttimeserializer
    queryset = Appointment.objects.all().filter(bookingdate__gte=date.today())
    def get_queryset(self):
        patient_id = self.kwargs['patient_id']
        queryset = self.queryset.filter(patient=patient_id)
        return queryset
    def list(self, request, *args, **kwargs):
        queryset = self.filter_queryset(self.get_queryset())
        lis = []
        for i in list(queryset):
            time = str(i.bookingtime)
            time1 = (time[:time.rfind(':')])
            dic = model_to_dict(i)
            dic.pop("doctor")
            dic.pop("id")
            dic["doctor_id"] = i.doctor.doc_id
            dic["doctor"] = i.doctor.pro.first_name+" "+i.doctor.pro.middle_name+" "+i.doctor.pro.last_name
            dic["bookingtime"] = time1
            lis.append(dic)

        return Response(lis)

#billing
class generatebill(CreateAPIView):
    serializer_class = consultfeebill

    # def create(self, request, *args, **kwargs):
    #     new_data =  request.data
    #     ##print new_data,'ooooooooooo'
    #     newdata = {}
    #     for i in new_data:
    #         newdata[i] = new_data[i]
    #     serializer = self.get_serializer(data=newdata)
    #     serializer.is_valid(raise_exception=True)
    #     self.perform_create(serializer)
    #     pat_id = serializer.data['patient']
    #     patient = Patient.objects.filter(UHID=pat_id).last()
    #     rec_id = serializer.data['doctor']
    #     reciption = User.objects.filter(id=rec_id).last()
    #     recprofile = Profile.objects.filter(user_id=reciption.id).last()
    #     patname = patient.pat.first_name+' '+patient.pat.middle_name+' '+patient.pat.last_name
    #     recname = recprofile.first_name+' '+recprofile.middle_name+' '+recprofile.last_name
    #     headers = self.get_success_headers(serializer.data)
    #     data = serializer.data
    #     data["patient"]= patname
    #     data["doctor"] = recname
    #     return Response(data, status=status.HTTP_201_CREATED, headers=headers)

# def finalbill(request,id):
#     rec_id = request.user.id
#     pro  = Profile.objects.get(user_id=rec_id)
#     recname = pro.first_name + ' ' + pro.middle_name + ' ' + pro.last_name
#     appoint = Appointmentrequest.objects.get(id=id)
#     pat_id = appoint.patient.pat.id





class billget(ListAPIView):
    lookup_field = 'patient_id'
    serializer_class = consultfeebillget
    queryset = consultfee.objects.all()

    def get_queryset(self):
        patient_id = self.kwargs['patient_id']
        queryset = self.queryset.filter(patient=patient_id)
        return queryset


def consultfeeview(request,id):
    rec_id = request.user.id
    pro = Profile.objects.get(user_id=rec_id)
    recname = pro.first_name+' '+pro.middle_name+' '+pro.last_name
    appoint = Appointment.objects.get(id=id)
    name = appoint.patient.pat.first_name+' '+appoint.patient.pat.middle_name+' '+appoint.patient.pat.last_name
    docname = appoint.doctor.pro.first_name+' '+appoint.doctor.pro.middle_name+' '+appoint.doctor.pro.last_name
    bookdate = appoint.bookingdate
    bookdate=bookdate.strftime("%d-%m-%Y")
    booktime = appoint.bookingtime 
    booktime=booktime.strftime("%H:%M %p")
    pat_id = appoint.patient.pat.id
    uhid = appoint.patient.UHID
    doc_id = appoint.doctor.doc.id
    doc = appoint.doctor.doc.id
    docamount = DoctorSlots.objects.filter(doctor_id=doc).last()
    amount = docamount.consultationfee
    fname = appoint.patient.pat.first_name
    # billid = consultfee.objects.all().last().id

    return render(request,'consult.html',{'name':name,'docname':docname,'recname':recname,'bookdate':bookdate,'booktime':booktime,
                                          'pat_id':pat_id,'doc_id':doc_id,'amount':amount,'rec_id':rec_id,'uhid':uhid,'fname':fname,"a_id":id})







#Creating ourview, it is a

# class GeneratePdf(View):
#     def get(self, request, *args, **kwargs):
#         # getting the template
#         pdf = render_to_pdf('consult.html')
#
#         # rendering the template
#         return HttpResponse(pdf, content_type='application/pdf')


@api_view(['GET', 'POST'])
def multibreakslots(request):
    try:
        customer = Appointment.objects.all()
    except Appointment.DoesNotExist:
        return Response(status=status.HTTP_404_NOT_FOUND)

    if request.method == 'GET':
        data = request.GET
        stime = data["starttime"].split(":")
        stime = time(hour=int(stime[0]),minute=int(stime[1]))
        etime = data["endtime"].split(":")
        etime = time(hour=int(etime[0]),minute=int(etime[1]))
        dur = int(data["duration"].split()[0])
        print(stime,etime,dur)
        slots = generateslots(dur,stime,etime,None)
        print(slots)
        return Response(slots.split(","))

    # elif request.method == 'POST':
    #     serializer = CustomerTypeSerializer(customer, data=request.data)
    #     if serializer.is_valid():
    #         serializer.save()
    #         return Response(serializer.data)
    #     return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

class BlockslotView(CreateAPIView,ListAPIView):
    lookup_field = "doctor_id"
    serializer_class = blockslotserializer
    queryset = BlockSlots.objects.all()

    def get(self, request, *args, **kwargs):
        date = request.GET["blockdate"]
        self.queryset = self.queryset.filter(blockdate=date)
        return self.list(request, *args, **kwargs)
    def post(self, request, *args, **kwargs):
        doc = request.data["doctor"]
        blockdate = request.data["blockdate"]
        blockslot =request.data["blockslot"]
        try:
            obj = Appointment.objects.get(doctor_id = doc,bookingdate =blockdate,bookingtime =blockslot)
            if obj:
                obj.delete()
        except Appointment.DoesNotExist:
            pass
        print(2112)
        return self.create(request, *args, **kwargs)

class Opdappointment(RetrieveUpdateDestroyAPIView):
    lookup_field = "id"
    serializer_class = appointmentserializer
    queryset = Appointment.objects.all()