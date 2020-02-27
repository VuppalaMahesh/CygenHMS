from django.conf.urls import url
from . import views
#(?P<pk>[0-9]*)

urlpatterns = [
    url(r'^wards/(?P<pk>[0-9]*)$', views.WardView.as_view()),
    url(r'^floors/(?P<pk>[0-9]*)$',views.FloorView.as_view()),
    url(r'^rooms/(?P<pk>[0-9]*)$',views.RoomsView.as_view()),
    url(r'^roomsbeds/(?P<roomNo>[0-9]+)/$', views.RoomsRetriveView.as_view()),
    url(r'^roomsbeds/$',views.RoomsListView.as_view()),
    url(r'^roomtype/(?P<pk>[0-9]*)$', views.RoomstypeView.as_view()),
    url(r'^bed_details/(?P<roomNo>[0-9]*)$',views.Getbedsview.as_view()),
    url(r'^beds/(?P<pk>[0-9]*)$',views.BedTableView.as_view()),
    url(r'^bed/((?P<appointment_id>[0-9]*)/(?P<textflag>[a-zA-Z0-9]*))*/*$', views.AppointedBedView.as_view()),
    # url(r'^floors/$',views.createFloor.as_view()),
    # url(r'room/$',views.Createrooms.as_view()),
    # url(r'getbeds/(?P<roomNo>[0-9]*)$',views.Getbedsview.as_view()),
    url(r'^bms_list/$', views.bms_list_view, name='bedmanagement'),
    url(r'^rooms_list/$', views.rooms_list_view, name='roomsmanagement'),
    url(r'^bedstatus/(?P<appointmenId>[0-9]*)$', views.appointbedCreateApiview.as_view()),
    url(r'^bedappointed/(?P<appointmentid>[0-9]*)$', views.AppointedBedView.as_view()),
    url(r'^NurseInpatient_table/$', views.NurseInpatient_table_view, name='nurseinpatient'),
    url(r'^NurseInpatient_transfer/(?P<appointment>[0-9]*)$', views.NurseInpatient_transfer_view, name='nurseinpatient'),
]