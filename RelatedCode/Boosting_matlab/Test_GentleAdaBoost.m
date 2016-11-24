function [mean_control_error] = Test_GentleAdaBoost(file_data)

%addpath 'datas';

% Step1: reading Data from the file
%file_data = load('ionosphere.txt');
Data = file_data(:,1:end-1)';
Labels = file_data(:, end)';
Labels = Labels*2 - 1;

MaxIter = 200;  % boosting iterations
Validation = 5; % 5-cross validation

[m, n] = size(Data);
Indices = crossvalind('Kfold', n, Validation);
control_error = zeros(1, Validation);
for cr = 1 : Validation
    % Step2: splitting data to training and control set
    TrainData   = Data(:, find(Indices ~= cr)');
    TrainLabels = Labels(find(Indices ~= cr)');

    ControlData   = Data(:,find(Indices == cr)');
    ControlLabels = Labels(find(Indices == cr)');

    % and initializing matrices for storing step error
    GAB_control_error = zeros(1, MaxIter);

    % Step3: constructing weak learner
    weak_learner = tree_node_w(3); % pass the number of tree splits to the constructor

    % and initializing learners and weights matices
    GLearners = [];
    GWeights = [];

    % Step4: iterativly running the training

    for lrn_num = 1 : MaxIter

        %clc;
        %disp(strcat('Boosting step: ', num2str(lrn_num),'/', num2str(MaxIter)));

        %training gentle adaboost
        [GLearners GWeights] = GentleAdaBoost(weak_learner, TrainData, TrainLabels, 1, GWeights, GLearners);

        %evaluating control error
        GControl = sign(Classify(GLearners, GWeights, ControlData));

        GAB_control_error(lrn_num) = GAB_control_error(lrn_num) + sum(GControl ~= ControlLabels) / length(ControlLabels);

    end

    % Step4: Get last 10 mean error
    control_error(cr) = mean(GAB_control_error(MaxIter-9:MaxIter));
end
mean_control_error = mean(control_error);