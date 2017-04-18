load('feature_test.mat');
load('label10_test.mat');

#c=[0.0000038146,0.0000152587,0.0000610351,0.0002441406,0.0009765625,0.00390625,0.015625,0.0625,0.25,1,4,16,64,256,1024,4096,16384,65536];
c=[0.0000038146,0.0000152587,0.0000610351,0.0002441406,0.0009765625,0.00390625,0.015625,0.0625,0.25,1];
prev_accu=0;   
prev_c=0.0000038146;
for i=1:length(c), 
model = svmTrain(feature_train,y,c(i),@linearKernel);
pred=svmPredict(model,normalize(feature_test));
 
printf('\naccuracy of svm using linear Kernel for ten days\n'); 
accuracy_linear=(sum(pred == label10_test))/size(label10_test,1)
if(prev_accu<accuracy_linear),
prev_accu=accuracy_linear;
prev_c=c(i);
end;

end;

  
prev_c
prev_accu   
   

