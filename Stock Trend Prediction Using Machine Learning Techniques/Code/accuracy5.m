function c = accuracy5(theta)
load('feature_test.mat');
load('label5_test.mat');
y=label5_test;
feature_test=normalize(feature_test);
s=size(feature_test,1);
x=[ones(s,1),feature_test];
k=[];
k=x*theta;

t=k>0;

c=sum(y==t);
c/size(feature_test,1)