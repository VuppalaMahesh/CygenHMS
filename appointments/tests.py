# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.test import TestCase

# Create your tests here.
from bs4 import BeautifulSoup
import requests
from pyquery import PyQuery as pq
import re
from time import sleep
import pandas as pd
import xlwt
import openpyxl

#page = requests.get('https://www.medindia.net/drug-price/brand-index.asp?alpha=a')
#page = requests.get('https://www.medindia.net/drug-price/brand-index.asp?alpha=a')
#https://www.medindia.net/drug-price/brand-index.asp?alpha=a&page=2
# sleep(10)
# contents = page.content
# #print(contents)
# doc = pq(contents)
# text = doc("a").text()
#soup = BeautifulSoup(page.content, 'html.parser')



data = []

for i in range(1, 30):
    page = requests.get('https://www.medindia.net/drug-price/brand-index.asp?alpha=b&page='+str(i))
    sleep(5)
    soup = BeautifulSoup(page.content, 'html.parser')
    for table in soup.findAll('table'):
        for row in table.findAll('tr'):
            for col in row.findAll('a'):
                data.append(col)

import pandas as pd
df = pd.DataFrame.from_dict({'Column2':data})
df.to_excel(r'C:\Users\user\Desktop\medicine_data.xlsx', header=True, index=False)
print(data)

