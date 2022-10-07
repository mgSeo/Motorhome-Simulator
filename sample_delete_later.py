import numpy as np
import pandas as pd
import copy
## parameters ############################
Foldername = 'Parameter_fitting'
Filename = 'port17_disagg_sample.csv'
##########################################

Data = pd.read_csv(Foldername + '/' + Filename)
data = copy.deepcopy(Data)
port_option = [0,1,2,3,6,7,8,9,10,11,12,13,15,18,34,36]
# port_option = [7,8,9,10,15,34,36]
for p in port_option:
    port = 'port{}'.format(p)
    idx = data[data[port]>0].index
    data.drop(idx,inplace=True)

idx = data[data['power']<3].index
data.drop(idx,inplace=True)

idx = data[data['power']>45].index
data.drop(idx,inplace=True)

data.to_csv('drop_17.csv',index=False)