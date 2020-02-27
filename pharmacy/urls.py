from .views import *
from django.conf.urls import url


urlpatterns = [
    url(r'^api/customers/', customer_list),
    url(r'^api/customer/(?P<pk>[0-9]+)', customer_detail),
    url(r'^api/orders/', order_list),
    url(r'^api/order/(?P<pk>[0-9]+)', order_details),
    url(r'^api/purchasetax/', tax_option_list),
    url(r'^api/paymentoption/', payment_option_list),
    url(r'^api/medicines/', medicine_list),
    url(r'^api/medicine/(?P<pk>[0-9]+)', medicine_detail),
    url(r'^api/storelocations/', store_location_list),
    url(r'^api/medicinecategory/', medicine_category_list),
    url(r'^api/suppliers/', supplier_list),
    url(r'^api/supplier/(?P<pk>[0-9]+)', supplier_detail),
    url(r'^sales/', sale_list),
    url(r'^sale/<int:pk>', sale_detail),
    #fdad urls

    url(r"^medications.ts$", MedicationNamesListAPI.as_view(), name="fdadb-medications.ts-names"),
    url(
        r"^medications.ts/(?P<medication_name>[\w-]+)/strengths$",
        MedicationStrengthsListAPI.as_view(),
        name="fdadb-medications.ts-strengths",
    ),
    url(
        r"^medications.ts/(?P<medication_name>[\w-]+)/strengths/(?P<strength_id>[\d-]+)/ndcs$",
        MedicationNDCsListAPI.as_view(),
        name="fdadb-medications.ts-ndcs",
    ),
    url(r'^api/patientappoints/', get_patient_appointment.as_view()),
    url(r'^api/getpatientmedications/$', PatientMedicationsview.as_view()),
]
