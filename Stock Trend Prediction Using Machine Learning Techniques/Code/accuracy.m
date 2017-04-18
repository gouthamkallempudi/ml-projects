function c = accuracy(theta)
load('feature_train.mat');
feature_train=feature_train((21:size(feature_train)),:);
load('label10_train.mat');
label10_train=label10_train((11:size(label10_train)),:);
m1=size(feature_train,1);
feature_train=normalize(feature_train);
x=[ones(m1,1),feature_train];
n1=size(x,2);
y=label10_train;

arr=[];
for i=1:size(x,1)
p=x(i,:)*theta;
arr=[arr;p];
end;

t=arr>0;
c=sum(y==t);
c/size(feature_train,1);