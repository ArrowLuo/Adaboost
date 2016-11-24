function BuildTree(fatherNodeName,edge,data,label,propertyName,delta)  
%UNTITLED9 Summary of this function goes here  
%   Detailed explanation goes here  

propertyName

global Node;  
sonNode=struct('fatherNodeName',[],'EdgeProperty',[],'NodeName',[]);  
sonNode.fatherNodeName = fatherNodeName;  
sonNode.EdgeProperty = edge;  
if length(unique(label)) == 1               
    sonNode.NodeName=label(1);  
    Node=[Node sonNode];  
    return;  
end  
if length(propertyName) < 1  
    labelSet = unique(label);
    labelNum = length(labelSet);
    labelNumS = zeros(1, labelNum);
    for i = 1:labelNum
        labelNumS(i) = length(find(label==labelSet(i)));
    end
    [~, labelIndex] = max(labelNumS);
    sonNode.NodeName = labelSet(labelIndex);
    Node = [Node sonNode];
    return;
end
[sonIndex, BuildNode] = CalcuteNode(data, label, delta);  
if BuildNode  
    dataRowIndex = setdiff(1:length(propertyName), sonIndex);  
    sonNode.NodeName = propertyName(sonIndex);  
    Node = [Node sonNode];  
    propertyName(sonIndex) = [];  
    sonData = data(:,sonIndex);  
    sonEdge = unique(sonData);  
      
    for i = 1:length(sonEdge)
        edgeDataIndex = find(sonData == sonEdge(i));
        BuildTree(sonNode.NodeName, sonEdge(i), data(edgeDataIndex, dataRowIndex), label(edgeDataIndex,:), propertyName, delta);  
    end
else  
    labelSet = unique(label);
    labelNum = length(labelSet);
    labelNumS = zeros(1, labelNum);
    for i = 1:labelNum
        labelNumS(i) = length(find(label==labelSet(i)));
    end
    [~, labelIndex] = max(labelNumS);
    sonNode.NodeName = labelSet(labelIndex);
    Node = [Node sonNode];
    return;
end  