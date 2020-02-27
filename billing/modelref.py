# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from usermanagement.models import *
from appointments.models import *
from patientmanagement.models import *
from billing.models import *


def get_model(group,):
    lis = BillGroup.purpose
    key = filter(lambda v: True if (group in v) else False, lis)
    items = BillGroup.modelref
    model = filter(lambda v: True if (group in v) else False,items)[0][1]
    return model