from django.db import models
from appointments.models import Appointment
# Create your models here.

class Floor(models.Model):
    FloorNum= models.IntegerField()

    def __str__(self):
        return str(self.FloorNum)


class wards(models.Model):
    WardType = models.CharField(max_length=50, null=True, blank=True)
    def __str__(self):
        return "{}".format(self.WardType)

class RoomType(models.Model):

    RT = [
        (1, "AC"),
        (2, "NON-AC"),
    ]
    OCTYPE = [
        (1, "Single"),
        (2, "Double"),
    ]
    roomtype = models.PositiveSmallIntegerField(choices=RT)
    occutype = models.CharField(max_length=50,choices=OCTYPE, null=True, blank=True)

class RoomTable(models.Model):
    roomNo = models.IntegerField(unique=True)
    wardId = models.ForeignKey(wards, on_delete=models.CASCADE, null=True, blank=True)
    floorId = models.ForeignKey(Floor,on_delete=models.CASCADE, null=True, blank=True)
    roomtypeId = models.ForeignKey(RoomType, on_delete=models.CASCADE, null=True, blank=True)
    Price = models.FloatField(null=True,blank=True)


    def __str__(self):
        return '{}'.format(self.roomNo)
class BedTable(models.Model):
    # ward = models.ForeignKey(wards, on_delete=models.CASCADE, null=True, blank=True)
    bedNum= models.CharField(max_length=50, null=True, blank=True,)
    # bedPrice = models.IntegerField()
    # bedDesc = models.CharField(max_length=500, null=True, blank=True)
    roomid= models.ForeignKey(RoomTable,on_delete=models.CASCADE, null=True, blank=True, related_name="beds")
    status=models.BooleanField(default=0)

    def __str__(self):
        return self.bedNum


class FloorWardTable(models.Model):
    wardid=models.ForeignKey(wards,on_delete=models.CASCADE, null=True, blank=True)
    floorid=models.ForeignKey(Floor,on_delete=models.CASCADE, null=True, blank=True)


# class appointbed(models.Model):
#     appointment = models.ForeignKey(Appointment, on_delete=models.CASCADE)
#     bedid = models.ForeignKey(BedTable, on_delete=models.CASCADE)
#     datetime = models.DateTimeField(auto_now_add=True)
class AllotBed(models.Model):
    appointment = models.ForeignKey(Appointment, on_delete=models.CASCADE)
    bed = models.ForeignKey(BedTable, on_delete=models.CASCADE)
    datetime = models.DateTimeField(auto_now_add=True)