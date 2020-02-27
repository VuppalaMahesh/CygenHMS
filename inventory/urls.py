from .views import *
from django.conf.urls import url

urlpatterns = [
    url(r'^departments/$', department_list),
    url(r'^department/(?P<pk>[0-9]+)/$', department_detail),
    url('products/', product_list),
    url('product/(?P<pk>[0-9]+)/$', product_detail),
    url('productcategory/', product_category_list),
    url(r'^purchaseOrders/', purchase_order_list),
    url(r'^purchaseOrder/(?P<pk>[0-9]+)/$', purchase_order_detail),
    url(r'^purchaseOrdersDateRange/', purchase_order_date_range),
    url(r'^vendors/$', vendor_list),
    url(r'^vendor/(?P<pk>[0-9]+)/$', vendor_detail),
    url(r'dashboard/$', countview)
]
