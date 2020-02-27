from django.conf.urls import url,include
from . import views

urlpatterns = [
    url(r'^appointment/$',views.appointmentslot.as_view(), name="appointment"),
    url(r'^doctoravailability/$',views.DoctorSlotspost.as_view(), name="doctortimes"),
    url(r'^slots/(?P<doctor_id>[0-9]+)/$',views.getappoints, name="appointment"),
    url(r'^appointment/(?P<doctor_id>[0-9]+)/$',views.appointmentchoices.as_view(), name="choices"),
    url(r'^getappointment/(?P<patient_id>[A-Z]+-00-[0-9]+)/$',views.getappointtime.as_view(), name='getappointtime'),
    url(r'^consultfee/$',views.generatebill.as_view(), name='bill'),
    url(r'^consultation/(?P<id>[0-9]+)/$',views.Opdappointment.as_view()),
    url(r'^consultfee/get/(?P<patient_id>[A-Z]+-00-[0-9]+)/$',views.billget.as_view(), name='getbill'),
    url(r'^consultationfee/(?P<id>[0-9]+)/$',views.consultfeeview, name='getbill'),
    url(r'^multibreak/$', views.multibreakslots, name='getbill'),
    url(r'^blockslot/(?P<doctor_id>[0-9]+)/$',views.BlockslotView.as_view(), name="choices"),
]