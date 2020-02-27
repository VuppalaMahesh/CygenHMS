from __future__ import unicode_literals
from rest_framework import serializers
from .models import AllotBed
#from rest_framework.serializers import ModelSerializer

from .models import wards, BedTable, Floor, RoomTable,RoomType,FloorWardTable

class WardSerializer(serializers.ModelSerializer):

    class Meta:
        model = wards
        fields = "__all__"




class FloorSerializer(serializers.ModelSerializer):

    class Meta:
        model = Floor
        fields= "__all__"


class RoomtypeSerializer(serializers.ModelSerializer):

    class Meta:
        model = RoomType
        fields= "__all__"

class BedTableSerializer(serializers.ModelSerializer):
    class Meta:
        model = BedTable
        fields = '__all__'


class RoomSerializer(serializers.ModelSerializer):
    roomtypeId = RoomtypeSerializer(required=True)
    beds = BedTableSerializer(many=True)
    wardId = WardSerializer(required=True)
    class Meta:
        model = RoomTable
        fields= "__all__"

class RoomtableSerializer(serializers.ModelSerializer):
    roomtypeId = RoomtypeSerializer(required=True)
    bedNum = serializers.IntegerField(write_only=True)
    class Meta:
        model = RoomTable
        # fields= "__all__"
        exclude = ["roomNo",]
    def create(self, validated_data):
        bed_data = validated_data.pop('bedNum')
        f = validated_data['floorId']
        fb = RoomTable.objects.filter(floorId=f.id).last()
        if fb == None:
            validated_data['roomNo'] = f.FloorNum*100+1
        else:
            validated_data['roomNo'] = fb.roomNo+1
        room_data = validated_data.pop('roomtypeId')
        room = RoomtypeSerializer.create(RoomtypeSerializer(), validated_data=room_data)
        obj = RoomTable.objects.create(roomtypeId=room, **validated_data)
        lis = []
        counter = 97
        for i in range(bed_data):
            alpha = str(validated_data['roomNo'])+chr(counter)
            print(alpha)
            BedTable.objects.create(roomid=obj,bedNum=alpha)
            counter+=1
        return obj


class FloorwardSerializer(serializers.ModelSerializer):

    class Meta:
        model = FloorWardTable
        fields= "__all__"



class GetRoomTableSerializer(serializers.ModelSerializer):
    roomid = BedTableSerializer(required=True)
    class Meta:
        model = RoomTable
        fields = '__all__'


class Getbedsserializer(serializers.ModelSerializer):
    # roomNum = serializers.CharField(source="roomid")
    roomid = serializers.SerializerMethodField()
    def get_roomid(self, obj):
        print(obj.roomid)
        return '{}'.format(obj.roomid)
    class Meta:
        model = BedTable
        fields = ['roomid', 'bedNum', 'status']
class BedstatuschangeSerializer(serializers.ModelSerializer):

    class Meta:
        model = BedTable
        fields = ("id","status")

    def update(self,validated_data,instance=''):
        id =validated_data["id"]
        print(validated_data)

# class BedstatuschangeSerializer(serializers.ModelSerializer):
#
#     class Meta:
#         model = BedTable
#         fields = ("id","status")
#
#     def update(self,validated_data,instance=''):
#         id =validated_data["id"]
#         print(validated_data)

class BedstatuschangeSerializer(serializers.ModelSerializer):
    class Meta:
        model = BedTable
        fields = ("id", "bedNum", "status")


# class BedStatusSerializer(serializers.ModelSerializer):
#     bedid = BedstatuschangeSerializer(required=True)
#
#     class Meta:
#         model = appointbed
#         fields = ["appointmentid","bedid"]

    #
    # def create(self, validated_data):
    #     db=self.get_fields()
    #     # db =self.get_extra_kwargs()
    #     print(db)
    #     bed = validated_data.pop("bedid")
    #     print(bed.id)
    #     obj=BedTable.objects.get(id=bed["id"])
    #     # obj = BedTable.objects.get(bed["id"])
    #     # idd=obj
    #     bedin = BedstatuschangeSerializer.update(BedstatuschangeSerializer(),instance=obj,validated_data=bed)
    #     # bedin = BedstatuschangeSerializer.update(BedstatuschangeSerializer(), instance=idd, validated_data=bed)
    #     print(bedin)
    #     bedin.save()
    #     validated_data["bedid"]=bedin.id
    #     return super(BedStatusSerializer,self).create(**validated_data)
    #

class BedstatuschangeSerializer(serializers.ModelSerializer):
    class Meta:
        model = BedTable
        fields= "__all__"

class BedStatusSerializer(serializers.ModelSerializer):
    bed = BedstatuschangeSerializer(required=True)

    class Meta:
        model = AllotBed
        fields = "__all__"

    def create(self, validated_data):

        bed = validated_data.pop("bed")
        obj = BedTable.objects.get(bedNum=bed["bedNum"])
        bedin = BedstatuschangeSerializer.update(BedstatuschangeSerializer(), instance=obj, validated_data=bed)
        bedin.save()
        validated_data["bed"] = bedin
        return AllotBed.objects.create(**validated_data)

    def update(self, instance, validated_data):
        bed = validated_data.pop("bed")
        obj = BedTable.objects.get(bedNum=bed["bedNum"])
        bedin = BedstatuschangeSerializer.update(BedstatuschangeSerializer(), instance=obj, validated_data=bed)
        bedin.save()
        validated_data["bed"] = bedin
        return super(BedStatusSerializer,self).update(instance=instance,validated_data=validated_data)
