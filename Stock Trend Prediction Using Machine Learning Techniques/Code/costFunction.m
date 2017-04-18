function [J] = costFunction(theta)


load('feature_test.mat');
X=normalize(feature_test);
X=[ones(size(X,1),1) X];
load('label10_test.mat');
y=label10_test;

m = length(y); 
J = 0;
lambda=0;
k=sigmoid(X*theta);
l1=log(k);
l2=log(1-k);

sum1=(-y).*l1;
sum2=(1-y).*l2;
f=sum1-sum2;
i=theta;
i(1)=0;
i1=i.^2;

J=(sum(f)/m) + (lambda * (sum(i1)/(2*m))) ;

end

