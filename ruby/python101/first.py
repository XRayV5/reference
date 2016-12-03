import math

print("hello world")
print(0.2+0.3)

a = 0.1
print(type(a))
l = ['e','r','t']
print(l)
print(l.extend([1,2,3,4]))
print(l[1])
print(l[2])

l[len(l):] = ['ttt']

print(l)  

import numpy as np
import pandas as pd
cities  = pd.Series(['Atlanta','Lilburn','Athens',
                     'Auburn','Augusta','NYC','Buffalo','Albany',
                     'Miami','Tallahassee'])

states = pd.Series(['GA','GA','GA','GA','GA',
                    "NY","NY","NY","FL","FL"])

city_avg_incomes = pd.Series([55000,40000,50000,45000,
                              30000,60000,57000,56000,65000,40000])

city_populations = pd.Series([5000000,250000,100000,
                              50000, 200000,6000000,3000000,400000,
                              4000000,5000000])

city_table = pd.DataFrame( {'cities': cities,  
             'states': states,
             'city_avg_incomes':city_avg_incomes,
             'city_populations':city_populations
              } )

print(city_table)
city_table.head()
print(math.pi)

def calArea(r):
    area = math.pi*r*r
    return area

result = calArea(5)
print(result)

def calsqcb(num):
    if num < 10:
        num = math.pow(num, 2)
    elif num >= 10:
        num = math.pow(num, 3)
    return num

        
sqcb = calsqcb(10)
print(sqcb)

