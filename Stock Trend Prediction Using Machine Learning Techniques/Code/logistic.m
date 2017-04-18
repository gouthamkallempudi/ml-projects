function theta= logistic(x,y)
#load('newfeature.mat');
#feature=feature((21:251),:);
#load('newlabel.mat');
#list=list((11:241),:);
m=size(x,1);
#feature=normalize(feature);
#x=[ones(m,1),feature];
n=size(x,2);
#y=list;
prev_cost=100;
prev_alpha=0.0001;
prev_iter=100;
lambda=0;
f=[];
iter=[1000];
alpha=[0.05,0.10,0.15,0.20,0.25,0.30,0.35,0.40,0.45,0.50,0.55,0.60,0.65,0.70,0.75,0.800,0.85,0.90,0.95,1];
for i=1:length(alpha)
   for z=1:length(iter) 
      theta=zeros(n,1);
      grad=zeros(n,1);
         for itr = 1:iter(z)
            k=sigmoid(x*theta);
            k=k-y;
            grad=x'*k;

            j=theta;
            j(1)=0;
             reg=sum(j,1);
             grad=(grad/m) + lambda*(reg/m);
             theta=theta-(alpha(i) * grad);
          end;
    cost=costFunction(theta);
    f=[f cost];
    if(cost<prev_cost)
       prev_cost=cost;
       prev_alpha=alpha(i);
       prev_iter=iter(z);
    end;   
    end;                            
end;

#plot(alpha , f)
#xlabel(" alpha ")
#ylabel(" cost ")
#title("cost vs alpha")


prev_cost;
prev_alpha
prev_iter;

end;