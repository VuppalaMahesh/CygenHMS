from django.conf.urls import url,include
from . import views

urlpatterns = [
    url(r'^billgenrate/$',views.billgenerate.as_view(), name="bill"),
    url(r'^billgroup/',views.billgroup.as_view(),name='billgroup'),
    url(r'^bills/(?P<appointment_id>[0-9]+)/$', views.billsview, name='billstemplate'),
    url(r'^billing/(?P<id>[0-9]+)/(?P<group>[a-zA-Z0-9]+)/(?P<billid>[a-zA-Z]+-[a-zA-Z0-9]+-[0-9]+)/$', views.billingview, name='billinvoice'),

]
