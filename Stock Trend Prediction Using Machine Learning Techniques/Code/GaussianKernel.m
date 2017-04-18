function sim = GaussianKernel(x1,x2)

t=x1-x2;
t=t.^2;
sigma=3;
sim=exp(-sum(t)/(2*(sigma*sigma)));