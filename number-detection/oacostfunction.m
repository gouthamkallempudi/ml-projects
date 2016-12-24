function[J,grad]=oacostfunction(theta,X,y,lambda)

J=0;
grad=zeros(size(theta));
m=length(y);
k=sigmoid(X*theta);
l1=log(k);
l2=log(1-k);
sum1=(-y).*l1;
sum2=(1-y).*l2;
f=sum1-sum2;
w1=theta;
w1(1)=0;
w=w1.^2;
J=sum(f)/m  +   (lambda*sum(w))/(2*m);


a=sigmoid(X*theta)-y;
i=theta;
i(1)=0;

grad=(X'*a)+(lambda*i);
grad=grad/m;
grad =grad(:);

end;
