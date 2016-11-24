function [mean_control_error] = Test_SVM(file_data)

%addpath 'datas';
%file_data = load('ionosphere.txt');
data = file_data(:,1:end-1);
groups = file_data(:, end);

Validation = 5; % 5-cross validation

[m, n] = size(data);
Indices = crossvalind('Kfold', m, Validation);
control_error = zeros(1, Validation);
for cr = 1 : Validation
    train = find(Indices ~= cr)';
    test = find(Indices == cr)';

    cp = classperf(groups);
    option = statset('MaxIter', 30000);
    svmStruct = svmtrain(data(train,:), groups(train), 'Kernel_Function', 'rbf', 'quadprog_opts', option );
    classes = svmclassify(svmStruct, data(test,:));
    classperf(cp, classes, test);
    control_error(cr) = 1 - cp.CorrectRate
end
mean_control_error = mean(control_error);