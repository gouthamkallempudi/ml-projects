function [theta] = gradientdescent(initial_theta,X,Y)


iter=393;
alpha=0.1;
m=size(Y,1);
X=normalize(X);
Y=normalize(Y);
X=[ones(m,1) X];


theta=zeros(size(initial_theta,1),1);
grad=zeros(size(initial_theta,1),1);


for iter = 1:iter
grad=X'*(X*theta-Y);
grad=grad/m;
theta=theta-(alpha * grad);

end;


