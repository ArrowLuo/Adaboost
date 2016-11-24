function result = CEntropy(propertyList)  
% Calculate Entropy for each property
% H(D) = -\sum_{k=1}^{K}\frac{C_k}{D}log\frac{C_k}{D}
result = 0;  
totalLength = length(propertyList);  
itemList = unique(propertyList);  
pNum = length(itemList);  
for i=1:pNum  
    itemLength = length(find(propertyList == itemList(i)));  
    pItem = itemLength / totalLength;  
    result = result-pItem*log2(pItem);  
end  