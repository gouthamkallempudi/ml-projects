#predicting  closed prices
load('amzn_up.csv');

X=[amzn_up(:,1), amzn_up(:,2), amzn_up(:,3)];
Y=[amzn_up(:,4)];

m=size(X ,1);
n=size(X ,2);

initial_theta=[zeros(n+1,1)];
t=gradientdescent(initial_theta,X,Y);

printf("\npredicted values for April 12\n")
[1 903.09 904.09 895.25]*t


#predicting the stock trend 

printf('\n----------------Applying logistic Regression for 10 days-------------\n');

load('feature_train.mat');
feature_train=feature_train((21:size(feature_train)),:);
load('label10_train.mat');
label10_train=label10_train((11:size(label10_train)),:);
m1=size(feature_train,1);
feature_train=normalize(feature_train);
x=[ones(m1,1),feature_train];
n1=size(x,2);
y=label10_train;
val=logistic(x,y);

#printf("acuuracy of training data");
#accuracy(val)
printf("\nacuuracy of testing data for 10 days\n");
accuracy10(val)


printf('\n----------------Applying logistic Regression for 5 days-----------------\n');

load('label5_train.mat');
label5_train=label5_train((16:size(label5_train)),:);
y1=label5_train;
val=logistic(x,y1);

printf("\nacuuracy of testing data for 5 days\n");
accuracy5(val)




printf('\n-----------------Applying logistic Regression for 3 days---------------\n');

load('label3_train.mat');
label3_train=label3_train((18:size(label3_train)),:);
y2=label3_train;
val=logistic(x,y2);

printf("\nacuuracy of testing data for 3 days\n");
accuracy3(val)


printf('\n -----------------Applying SVM ----------------------------------\n');

printf('\n------------------Linear kernel for ten days---------------------\n');

load('feature_test.mat');
load('label10_test.mat');

model = svmTrain(feature_train,y,0.1,@linearKernel);
pred=svmPredict(model,normalize(feature_test));
 
printf('\naccuracy of svm using linear Kernel for ten days\n'); 
accuracy_linear=(sum(pred == label10_test))/size(label10_test,1)

printf('\n------------------Linear kernel for five days---------------------\n');

load('label5_test.mat');

model = svmTrain(feature_train,y1,0.1,@linearKernel);
pred=svmPredict(model,normalize(feature_test));
 
printf('\naccuracy of svm using linear Kernel for five days\n'); 
accuracy_linear=(sum(pred == label5_test))/size(label5_test,1)

printf('\n------------------Linear kernel for three days-----------------------\n');

load('label3_test.mat');

model = svmTrain(feature_train,y2,0.1,@linearKernel);
pred=svmPredict(model,normalize(feature_test));
 
printf('\naccuracy of svm using linear Kernel for three days\n'); 
accuracy_linear=(sum(pred == label3_test))/size(label3_test,1)



printf('\n------------------Gaussian Kernel for ten days--------------------------\n');

model1=  svmTrain(feature_train,y,0.1,@GaussianKernel);
pred1=svmPredict(model1,normalize(feature_test));

printf('\naccuracy of svm using Gaussian Kernel for ten days\n'); 
accuracy_linear=(sum(pred1 == label10_test))/size(label10_test,1)



printf('\n------------------Gaussian Kernel for five days---------------------------\n');

model1=  svmTrain(feature_train,y1,0.1,@GaussianKernel);
pred1=svmPredict(model1,normalize(feature_test));

printf('\naccuracy of svm using Gaussian Kernel for five days\n'); 
accuracy_linear=(sum(pred1 == label5_test))/size(label5_test,1)



printf('\n------------------Gaussian Kernel for three days--------------------------\n');

model1=  svmTrain(feature_train,y2,0.1,@GaussianKernel);
pred1=svmPredict(model1,normalize(feature_test));

printf('\naccuracy of svm using Gaussian Kernel for three days\n'); 
accuracy_linear=(sum(pred1 == label3_test))/size(label3_test,1)



#p=labelnorm();

#plot(p)
#plot(x(:,2),p((1:1230),:),'.')

#printf("acuuracy of testing data for 5 days");
#accuracy5(val)

#printf("acuuracy of testing data for 3 days");
#accuracy3(val)

#initialTheta=zeros(35,1);
#theta=zeros(35,1);
#options= optimset('GradObj', 'on', 'MaxIter', '250'); % define the options data structure
#[optTheta, funtionVal, exitFlag]= fmincg(@(theta)(costFunction(theta, x, y)), initial_theta, options);
#printf("acuuracy of training data using fminunc");
#accuracy(optTheta)

