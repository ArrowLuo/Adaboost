% HumidityType=struct('high',1,'norm',2);  
% WindyType={'True',1,'False',0};  
% PlayGolf={'Yes',1,'No',0};  
% data=struct('Outlook',[],'Temperature',[],'Humidity',[],'Windy',[],'PlayGolf',[]);  
clc;clear;
Outlook=[1,1,3,2,2,2,3,1,1,2,1,3,3,2]';  
Temperature=[1,1,1,2,3,3,3,2,3,3,2,2,1,2]';  
Humidity=[1,1,1,1,2,2,2,1,2,2,2,1,2,1]';  
Windy=[0,1,0,0,0,1,1,0,0,0,1,1,0,1]';  
  
data=[Outlook Temperature Humidity Windy];  
PlayGolf=[0,0,1,1,1,0,1,0,1,1,1,1,1,0]';  
propertyName={'Outlook','Temperature','Humidity','Windy'};  
delta = 0.000001;  
decisionTreeModel = decisionTree(data,PlayGolf,propertyName,delta);  