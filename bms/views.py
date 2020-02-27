from django.http import Http404
from django.shortcuts import render

from .serializers import *
from .models import *
from rest_framework import generics,mixins
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework.generics import ListCreateAPIView
# Create your views here.

class WardView(ListCreateAPIView):

    queryset = wards.objects.all()
    serializer_class = WardSerializer

    def get_object(self, pk):
        try:
            return wards.objects.get(pk=pk)
        except wards.DoesNotExist:
            raise Http404

    def get(self, request, pk="", format=None):
        print
        pk
        if pk == '':
            data = wards.objects.all()
            serializer = WardSerializer(data, many=True)
        else:
            data = self.get_object(pk)
            serializer = WardSerializer(data)
        return Response(serializer.data)

class BedTableView(generics.ListCreateAPIView):

    queryset = BedTable.objects.all()
    serializer_class = BedTableSerializer

    def get_object(self, pk):
        try:
            return BedTable.objects.get(pk=pk)
        except BedTable.DoesNotExist:
            raise Http404

    def get(self, request, pk="", format=None):
        if pk == '':
            data = BedTable.objects.all()
            serializer = BedTableSerializer(data, many=True)
        else:
            data = self.get_object(pk)
            serializer = BedTableSerializer(data)
        return Response(serializer.data)



class FloorView(generics.ListCreateAPIView):

    queryset=Floor.objects.all()
    serializer_class = FloorSerializer

    def get_object(self, pk):
        try:
            return Floor.objects.get(pk=pk)
        except Floor.DoesNotExist:
            raise Http404

    def get(self, request, pk="", format=None):
        if pk == '':
            data = Floor.objects.all()
            serializer = FloorSerializer(data, many=True)
        else:
            data = self.get_object(pk)
            serializer = FloorSerializer(data)
        return Response(serializer.data)


class RoomsView(generics.ListCreateAPIView):
    serializer_class = RoomtableSerializer
    queryset = RoomTable.objects.all()
class RoomsRetriveView(generics.RetrieveAPIView):
    lookup_field = "roomNo"
    serializer_class = RoomSerializer
    queryset = RoomTable.objects.all()

class RoomsListView(generics.ListAPIView):
    lookup_field = "roomNo"
    serializer_class = RoomSerializer
    queryset = RoomTable.objects.all()

class RoomstypeView(generics.ListCreateAPIView):
    serializer_class = RoomtypeSerializer
    queryset = RoomType.objects.all()


class BedTableview(generics.ListAPIView):
    serializer_class = BedTableSerializer
    queryset = BedTable.objects.all()

class Getbedsview(generics.ListAPIView):
    serializer_class = Getbedsserializer
    lookup_field = 'id'
    lookup_url_kwarg = 'roomNo'
    queryset = BedTable.objects.all()

    def get_queryset(self):
        roomNo = self.kwargs[self.lookup_url_kwarg]
        queryset=BedTable.objects.filter(roomid__roomNo=roomNo)
        return queryset

def bms_list_view(request):
    return render(request, "bms_list.html")

def rooms_list_view(request):
    return render(request, "rooms_list.html")

class BedstausView(generics.ListCreateAPIView):
    lookup_field = "appointmenId"
    serializer_class = BedStatusSerializer
    queryset = AllotBed.objects.all()



class appointbedCreateApiview(generics.CreateAPIView):

    queryset =AllotBed.objects.all()
    serializer_class =BedStatusSerializer

# class bedcontext(APIView):
#     def get


class AppointedBedView(generics.ListCreateAPIView,generics.UpdateAPIView):
    lookup_field = "appointment_id"
    queryset =AllotBed.objects.all()
    serializer_class =BedStatusSerializer

    def get_object(self, appointment_id=''):
        try:
            if appointment_id == '':
                return AllotBed.objects.all()
            else:
                return AllotBed.objects.get(appointment=appointment_id)
        except AllotBed.DoesNotExist:
            raise Http404

    def get(self, request, appointment_id="",textflag='', format=None):
        if appointment_id == '':
            data = AllotBed.objects.all()
            serializer = BedStatusSerializer(data, many=True)
        else:
            data = self.get_object(appointment_id)
            serializer = BedStatusSerializer(data)
        return Response(serializer.data)
 
    def patch(self, request, appointment_id="",textflag='', *args, **kwargs):
        if textflag=="discharge":
            a = Appointment.objects.get(id=appointment_id)
            a.flag =0
            a.save() 
        kwargs['partial'] = True
        partial = kwargs.pop('partial', False)
        instance = self.get_object(appointment_id)
        serializer = self.get_serializer(instance, data=request.data, partial=partial)
        serializer.is_valid(raise_exception=True)
        self.perform_update(serializer)

        if getattr(instance, '_prefetched_objects_cache', None):
            # If 'prefetch_related' has been applied to a queryset, we need to
            # forcibly invalidate the prefetch cache on the instance.
            instance._prefetched_objects_cache = {}

        return Response(serializer.data)


def NurseInpatient_table_view(request):
    return render(request, "NurseInpatient.html")

def NurseInpatient_transfer_view(request):
    return render(request, "NurseInpatient_transfer.html")

