function t = labelnorm()
g=load('amzn_up.csv');
x=[];
for i=1:size(g,1)
x=[g(i,:);x];
end;
y=x(:,4);
t=[];
for i=11:length(y)
    t=[t ; y(i)-y(i-10)];
end;


pos_max=max(t);
neg_min=min(t);

pos_min=pos_max;
for i=1:size(t,1),
if(t(i)<pos_min  && t(i)>0 ),
pos_min=t(i);
end;
end;

neg_max=neg_min;
for i=1:size(t,1)
if(t(i)>neg_max && t(i)<0)
neg_max=t(i);
end;
end;

#min max normalization
new_pos_min=0.5;
new_pos_max=1;
new_neg_min=0;
new_neg_max=0.49; 
for i=1:size(t,1)
if(t(i)>0)
t(i)=(((t(i)-pos_min)/(pos_max-pos_min))*(new_pos_max-new_pos_min))+new_pos_min;
else
t(i)=(((t(i)-neg_min)/(neg_max-neg_min))*(new_neg_max-new_neg_min))+new_neg_min;
end;
end;

 