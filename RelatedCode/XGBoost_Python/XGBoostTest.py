import sys
sys.path.append('D:\\Anaconda2\\xgboost-master\\wrapper\\')
from sklearn.cross_validation import train_test_split
import pandas as pd
import xgboost as xgb

forePath = "C:\\Users\\acer\\Desktop\\result\\"

dataset = pd.read_csv(forePath + "SPECTF_Heart.data", header=-1)
m =  len(dataset.index)
n = len(dataset.columns)

train = dataset.iloc[:,0:n-1].values
labels = dataset.iloc[:,n-1:n].values

# print train
# print labels

params={
    'booster':'gbtree',
    'objective': 'multi:softmax',
    'num_class':2,
    'gamma':0.05,
    'max_depth':12,
    #'lambda':450,
    'subsample':0.4,
    'colsample_bytree':0.7,
    #'min_child_weight':12,
    'silent':1 ,
    'eta': 0.005,
    'seed':710,
    'nthread':4,
}

plst = list(params.items())

offset = int(m * 0.8)

num_rounds = 200

xgtrain = xgb.DMatrix(train[:offset,:], label=labels[:offset])
xgval = xgb.DMatrix(train[offset:,:], label=labels[offset:])

watchlist = [(xgtrain, 'train'),(xgval, 'val')]

model = xgb.train(plst, xgtrain, num_rounds, watchlist, early_stopping_rounds = 100)

print model