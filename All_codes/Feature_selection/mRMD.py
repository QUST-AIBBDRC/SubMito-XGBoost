import numpy as np
import pandas as pd
import math

data = pd.read_csv('MRMD_set1.csv')
X=np.matrix(data)
optimal_feature =X[:,1:]
feature = pd.read_csv('set1_end.csv')
X1=np.matrix(feature)
X2=X1[:,1:]
A=[int(x) for x in optimal_feature]
set_end_MRMD=X2[:, A[:375]]
data_csv = pd.DataFrame(data=set_end_MRMD)
data_csv.to_csv('set1_MRMD_375.csv')

