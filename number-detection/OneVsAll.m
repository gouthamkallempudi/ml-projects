function[all_theta]=OneVsAll(X,y,num_labels,lambda)

%can also use build in LFGS advanced optimization technique i.e fminunc

m=size(X,1);
n=size(X,2);

all_theta=zeros(num_labels,n+1);

X=[ones(m,1),X];

options=optimset('GradObj','on','MaxIter',50);

initial_theta=zeros(n+1,1);

for c=1:num_labels,
[theta]=fmincg(@(t)(oacostfunction(t,X,(y==c),lambda)),initial_theta,options);
all_theta(c,:)=theta';


end;