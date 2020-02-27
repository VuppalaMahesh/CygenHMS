from django.conf.urls import url
from . import views
from django.views.decorators.csrf import csrf_exempt

urlpatterns = [
    url(r'^home/(?P<patient_id>[0-9]+)/$', views.homepage, name='home'),
    url(r'^ehrpatient/$', views.ehrpatient, name='patient'),
    # url(r'^patientpart/(?P<patient_id>[a-z A-Z]+-[0-9]+-[0-9]+)/$', views.patientpart, name='patient'),
    url(r'^manageuser/$', views.manageuser, name='usermanage'),
    url(r'^userprofile/(?P<user_id>[0-9]+)/$', views.userprofile, name='userprofile'),
    url(r'^createvital/$', views.Createvitalview.as_view(), name='createvitals'),
    url(r'^createallergie/$', views.Createallergiesview.as_view(), name='createallergy'),
    url(r'^createsocialhistory/$', views.CreateSocialhistoryview.as_view(), name='createsocial'),
    url(r'^createfamilyhistory/$', views.CreateFamilyhistoryview.as_view(), name='createfamily'),
    url(r'^createhealthhistory/$', views.CreateHealthhistoryview.as_view(), name='createhealth'),
    url(r'^createprescription/$', views.CreatePrescriptionview.as_view(), name='createmedica'),
    url(r'^createinpatientdetails/$', views.CreateInpatientdetailsview.as_view(), name='createinpatient'),
    url(r'^createtestsresults/$', views.Createtestsresultsview.as_view(), name='createtestsresult'),
    url(r'^createvisitreason/$', views.Createvisitreasonview.as_view(), name='createvisitreason'),
    url(r'^createprocedure/$', views.Createproceduresview.as_view(), name='createprocedure'),
    url(r'^createvaccine/$', views.Createvaccineview.as_view(), name='createvaccine'),
    url(r'^createstatus/$', views.Createstatusview.as_view(), name='createstatus'),
    url(r'^createalert/$', views.Createalertview.as_view(), name='createalert'),
    url(r'^createderivatives/$', views.Createderivativesview.as_view(), name='createderivatives'),
    url(r'^createproblems/$', views.Createproblemsview.as_view(), name='createproblems'),
    url(r'^createnote/$', views.Createnoteview.as_view(), name='note'),
    url(r'^createehrgoal/$', views.Creategoalview.as_view(), name='createehrgoal'),
    url(r'^createsymtoms/$', views.Createsymtomsview.as_view(), name='createsymtoms'),
    url(r'^createrefferal/$', views.Createrefferalview.as_view(), name='createrefferal'),
    url(r'^createattachfile/$', views.Createattachfileview.as_view(), name='createattachfile'),
    url(r'^createlabtestdetails/$', views.Createlabtestdetailsview.as_view(), name='createlabtestdetails'),
    url(r'^createamendements/$', views.CreateAmendmentsview.as_view(), name='createamendements'),
    url(r'^creatadvancederivatives/$', views.CreateAdvancederivativeview.as_view(), name='creatadvancederivatives'),
    url(r'^getvital/(?P<patient_id>[a-z A-Z]+-[0-9]+-[0-9]+)/$', views.Getvitalview.as_view(), name='getvital'),
    url(r'^getvitallist/(?P<patient_id>[a-z A-Z]+-[0-9]+-[0-9]+)/$', views.Getvitallistview.as_view(), name='getvital'),
    url(r'^getallergie/(?P<appoint_id>[0-9]+)/$', views.Getallergiesview.as_view(), name='getallergy'),
    url(r'^getsocialhistory/(?P<appoint_id>[0-9]+)/$', views.GetSocialhistoryview.as_view(), name='getsocial'),
    url(r'^getfamilyhistory/(?P<appoint_id>[0-9]+)/$', views.GetFamilyhistoryview.as_view(), name='getfamily'),
    url(r'^gethealthhistory/(?P<appoint_id>[0-9]+)/$', views.GetHealthhistoryview.as_view(), name='gethealth'),
    url(r'^getmedications/(?P<appoint_id>[0-9]+)/$', views.getmedicationview.as_view(), name='getmedica'),

    url(r'^getinpatientdetails/(?P<appoint_id>[0-9]+)/$', views.GetInpatientdetailsview.as_view(), name='getinpatient'),
    url(r'^gettestsresults/(?P<patient_id>[a-z A-Z]+-[0-9]+-[0-9]+)/$', views.Gettestsresultsview.as_view(), name='gettestsresult'),

    url(r'^gettestsresults/$', views.Gettestsresultsview1.as_view(),name='gettestsresult'),

    url(r'^getvisitreason/(?P<appoint_id>[0-9]+)/$', views.Getvisitreasonview.as_view(), name='getvisitreason'),
    url(r'^getprocedure/(?P<appoint_id>[0-9]+)/$', views.Getproceduresview.as_view(), name='getprocedure'),
    url(r'^getvaccine/(?P<appoint_id>[0-9]+)/$', views.Getvaccinesview.as_view(), name='getvaccine'),
    url(r'^getstatus/(?P<appoint_id>[0-9]+)/$', views.Getstatusview.as_view(), name='getstatus'),
    url(r'^getalert/(?P<appoint_id>[0-9]+)/$', views.Getalertview.as_view(), name='getalert'),
    url(r'^getderivatives/(?P<appoint_id>[0-9]+)/$', views.Getderivativesview.as_view(), name='getderivatives'),
    url(r'^getproblems/(?P<appoint_id>[0-9]+)/$', views.Getproblemssview.as_view(), name='getproblems'),

    url(r'^getnote/(?P<appoint_id>[0-9]+)/$', views.Getnoteview.as_view(), name='getnote'),
    url(r'^getehrgoal/(?P<appoint_id>[0-9]+)/$', views.Getgoalview.as_view(), name='getehrgoal'),

    url(r'^getsymtoms/(?P<appoint_id>[0-9]+)/$', views.Getsymtomsview.as_view(), name='getsymtoms'),
    url(r'^getrefferal/(?P<appoint_id>[0-9]+)/$', views.Getrefferalview.as_view(), name='getrefferal'),

    url(r'^getattachfile/(?P<appoint_id>[0-9]+)/$', views.Getattachfileview.as_view(), name='getattachfile'),
    url(r'^getlabtestdetails/(?P<appoint_id>[0-9]+)/$', views.Getlabtestdetailsview.as_view(),
        name='getlabtestdetails'),
    url(r'^getamendements/(?P<appoint_id>[0-9]+)/$', views.GetAmendmentsview.as_view(), name='getamendements'),
    url(r'^getadvancederivatives/(?P<appoint_id>[0-9]+)/$', views.GetAdvancederivativesview.as_view(),
        name='getadvancederivatives'),

    url(r'^udvital/(?P<id>[0-9]+)/$', views.RUDvitalview.as_view(), name='rudvital'),
    url(r'^udallergie/(?P<id>[0-9]+)/$', views.RUDallergiesview.as_view(), name='rudallergy'),
    url(r'^udsocialhistory/(?P<id>[0-9]+)/$', views.RUDSocialhistoryview.as_view(), name='rudsocial'),
    url(r'^udfamilyhistory/(?P<id>[0-9]+)/$', views.RUDFamilyhistoryview.as_view(), name='rudfamily'),
    url(r'^udhealthhistory/(?P<id>[0-9]+)/$', views.RUDHealthhistoryview.as_view(), name='rudhealth'),
    url(r'^udmedications/(?P<id>[0-9]+)/$', views.RUDMedicationsview.as_view(), name='rudmedica'),
    url(r'^udinpatientdetails/(?P<id>[0-9]+)/$', views.RUDInpatientdetailsview.as_view(), name='rudinpatient'),
    url(r'^udtestsresults/(?P<id>[0-9]+)/$', views.RUDtestsresultsview.as_view(), name='rudtestsresult'),

    url(r'^udvisitreason/(?P<id>[0-9]+)/$', views.RUDvisitreasonview.as_view(), name='RUDvisitreason'),
    url(r'^udprocedure/(?P<id>[0-9]+)/$', views.RUDproceduresview.as_view(), name='RUDprocedure'),

    url(r'^udvaccine/(?P<id>[0-9]+)/$', views.RUDvaccineview.as_view(), name='RUDvaccine'),
    url(r'^udstatus/(?P<id>[0-9]+)/$', views.RUDstatusview.as_view(), name='RUDstatus'),

    url(r'^udalert/(?P<id>[0-9]+)/$', views.RUDalertview.as_view(), name='RUDalert'),
    url(r'^udderivatives/(?P<id>[0-9]+)/$', views.RUDderivativesview.as_view(), name='RUDderivatives'),
    url(r'^udproblems/(?P<id>[0-9]+)/$', views.RUDproblemssview.as_view(), name='RUDproblems'),
    url(r'^udnote/(?P<id>[0-9]+)/$', views.RUDnoteview.as_view(), name='RUDnote'),
    url(r'^udehrgoal/(?P<id>[0-9]+)/$', views.RUDgoalview.as_view(), name='RUDehrgoal'),

    url(r'^udsymtoms/(?P<id>[0-9]+)/$', views.RUDsymtomsview.as_view(), name='RUDsymtoms'),
    url(r'^udrefferal/(?P<id>[0-9]+)/$', views.RUDrefferalview.as_view(), name='RUDrefferal'),

    url(r'^udattachfile/(?P<id>[0-9]+)/$', views.RUDattachfileview.as_view(), name='RUDattachfile'),
    url(r'^udlabtestdetails/(?P<id>[0-9]+)/$', views.RUDlabtestdetailsview.as_view(), name='RUDlabtestdetails'),
    url(r'^udamendements/(?P<id>[0-9]+)/$', views.RUDAmendmentsview.as_view(), name='RUDamendements'),
    url(r'^udadvancederivatives/(?P<id>[0-9]+)/$', views.RUDAdvancederivativesview.as_view(),
        name='RUDadvancederivatives'),
    url(r'^sendtestinmail/$', views.Testshaeview.as_view(), name='sendtestinmail'),
    url(r'^sendpharmacyinmail/$', views.Pharmacyview.as_view(), name='pharmacyinmail'),
    url(r'^sendreferalinmail/$', views.Referalview.as_view(), name='referalinmail'),
    url(r'^Vital_summary/(?P<pat_id>[0-9]+)/$',views.vitalsummaryview, name='referalinmail'),

    #url(r'^createvital/$', views.Createvitalview.as_view(), name='createvitals'),
    # medical codes
     url(r'^vaccine/$', views.Cvxcodesview, name='vaccine'),
     url(r'^icd10procedure/$', views.icd10Procedureview, name='procedure'),
     url(r'^Cptprocedure/$', views.CptProcedureview, name='procedure'),
     url(r'^hspcsprocedure/$', views.HspcsProcedureview, name='procedure'),
     url(r'^problems/$', views.Problemview, name='problems'),
     url(r'^test/$', views.Testorderview, name='test'),
     url(r'^systoms/$', views.Systomsview, name='systoms'),
     url(r'^medicationcodes/$', views.medicineview, name='medication'),


]