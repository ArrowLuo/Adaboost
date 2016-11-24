function [mean_control_error] = Test_KNN(file_data)

%addpath 'datas';

% Step1: reading Data from the file
%file_data = load('ionosphere.txt');
Data = file_data(:,1:end-1);
Labels = file_data(:, end);
Labels = Labels*2 - 1;

Validation = 5; % 5-cross validation

[m, n] = size(Data);
Indices = crossvalind('Kfold', m, Validation);
control_error = zeros(1, Validation);
for cr = 1 : Validation
    TrainData   = Data(find(Indices ~= cr), :);
    TrainLabels = Labels(find(Indices ~= cr));

    ControlData   = Data(find(Indices == cr), :);
    ControlLabels = Labels(find(Indices == cr));
    
    k=knnclassify(ControlData,TrainData,TrainLabels,2);
    control_error(cr) = length(find(k ~= ControlLabels)) / length(ControlLabels);
end
mean_control_error = mean(control_error);