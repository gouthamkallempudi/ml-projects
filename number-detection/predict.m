function t = predict(all_theta,u)
u=[1;u];
p=all_theta*u;
p
[val,id]=max(p');
t=id;
end