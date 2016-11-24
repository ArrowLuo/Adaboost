addpath 'datas';
file_data = load('ionosphere.txt');
disp(strcat('ionosphere KNN: ', num2str(Test_KNN(file_data))));

file_data = csvread('Pima.te.csv');
disp(strcat('Pima KNN: ', num2str(Test_KNN(file_data))));


file_data = load('haberman.data');
disp(strcat('haberman KNN: ', num2str(Test_KNN(file_data))));

file_data = load('SPECTF_Heart.data');
disp(strcat('SPECTF_Heart KNN: ', num2str(Test_KNN(file_data))));

file_data = load('mammographic_masses.data');
disp(strcat('mammographic_masses KNN: ', num2str(Test_KNN(file_data))));