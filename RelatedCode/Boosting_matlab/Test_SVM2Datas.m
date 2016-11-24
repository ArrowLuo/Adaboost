addpath 'datas';
%file_data = load('ionosphere.txt');
%disp(strcat('ionosphere SVM: ', num2str(Test_SVM(file_data))));
%
%file_data = csvread('Pima.te.csv');
%disp(strcat('Pima SVM: ', num2str(Test_SVM(file_data))));
%

file_data = load('haberman.data');
disp(strcat('haberman SVM: ', num2str(Test_SVM(file_data))));

%file_data = load('SPECTF_Heart.data');
%disp(strcat('SPECTF_Heart SVM: ', num2str(Test_SVM(file_data))));

%file_data = load('mammographic_masses.data');
%disp(strcat('mammographic_masses SVM: ', num2str(Test_SVM(file_data))));