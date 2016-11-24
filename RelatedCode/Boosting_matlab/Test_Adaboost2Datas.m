addpath 'datas';

% Step1: reading Data from the file

%file_data = load('mammographic_masses.data');
%disp(strcat('mammographic_masses RealAdaBoost: ', num2str(Test_RealAdaBoost(file_data))));
%disp(strcat('mammographic_masses ModestAdaBoost: ', num2str(Test_ModestAdaBoost(file_data))));
%disp(strcat('mammographic_masses GentleAdaBoost: ', num2str(Test_GentleAdaBoost(file_data))));

%file_data = load('ionosphere.txt');
%disp(strcat('ionosphere RealAdaBoost: ', num2str(Test_RealAdaBoost(file_data))));
%disp(strcat('ionosphere ModestAdaBoost: ', num2str(Test_ModestAdaBoost(file_data))));
%disp(strcat('ionosphere GentleAdaBoost: ', num2str(Test_GentleAdaBoost(file_data))));
%
%file_data = csvread('Pima.te.csv');
%disp(strcat('Pima RealAdaBoost: ', num2str(Test_RealAdaBoost(file_data))));
%disp(strcat('Pima ModestAdaBoost: ', num2str(Test_ModestAdaBoost(file_data))));
%disp(strcat('Pima GentleAdaBoost: ', num2str(Test_GentleAdaBoost(file_data))));
%
%
file_data = load('haberman.data');
disp(strcat('haberman RealAdaBoost: ', num2str(Test_RealAdaBoost(file_data))));
disp(strcat('haberman ModestAdaBoost: ', num2str(Test_ModestAdaBoost(file_data))));
disp(strcat('haberman GentleAdaBoost: ', num2str(Test_GentleAdaBoost(file_data))));
%
%file_data = load('SPECTF_Heart.data');
%disp(strcat('SPECTF_Heart RealAdaBoost: ', num2str(Test_RealAdaBoost(file_data))));
%disp(strcat('SPECTF_Heart ModestAdaBoost: ', num2str(Test_ModestAdaBoost(file_data))));
%disp(strcat('SPECTF_Heart GentleAdaBoost: ', num2str(Test_GentleAdaBoost(file_data))));
