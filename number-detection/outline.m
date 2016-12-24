input_layer_size=400;
num_labels=10;
load('ex3data1.mat');

fprintf('\nTraining one-Vs-All logistic-regression.....');

lambda=0.1;

[all_theta]=OneVsAll(X,y,num_labels,lambda);

pred=predict(all_theta,X(2056,:)')



