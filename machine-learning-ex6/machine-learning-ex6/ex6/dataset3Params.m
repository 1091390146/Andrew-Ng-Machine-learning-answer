function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%

%Ωª≤Ê Æ◊÷≤‚ ‘
para_c = [0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30];
para_s = para_c;
error = 100;


for i=1:length(para_c)
    for j=1:length(para_s)
        model = svmTrain(X, y, para_c(i), @(x1, x2) gaussianKernel(x1, x2, para_s(j)));
        predict = svmPredict(model, Xval);
        cur = mean(double(predict ~= yval));
        if cur < error
            error = cur;
            C = para_c(i);
            sigma = para_s(j);
        end
    end
end


%wid=[0.01;0.03;0.1;0.3;1;3;10;30];
%errors=0;
%for i=1:size(wid,1)
%    for j=1:size(wid,1)
%        model= svmTrain(X, y, wid(i), @(x1, x2) gaussianKernel(x1, x2, wid(j)));
%        predictions=svmPredict(model, Xval);
%        errors(i,j)=mean(double(predictions ~= yval));
%    end
%end
%error=min(min(errors));
%[i,j]=find(errors==error);
%C=wid(i);
%sigma=wid(j);





% =========================================================================

end
