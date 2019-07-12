function [J, grad] = costFunction(theta, X, y)
%COSTFUNCTION Compute cost and gradient for logistic regression
%   J = COSTFUNCTION(theta, X, y) computes the cost of using theta as the
%   parameter for logistic regression and the gradient of the cost
%   w.r.t. to the parameters.

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta
%
% Note: grad should have the same dimensions as theta
%

h = sigmoid(X*theta);

J = (-1/m) * (sum( y.*log(h) + (1-y).*log(1-h)));

%自己一开始以为写出梯度下降，也纳闷怎么不给阿尔法和迭代次数，数据迭代完也不对
%后来才发现只是要求theta的导数即可，就是PDF里给出的公式；
%注意-1/m是为了用梯度下降，也可以不乘，用梯度上升；
%alpha = 0.01;
%iterations = 1500;

%for iter = 1 : iterations
%	theta = theta - (1/m)*(X'*(h-y));	
%end

%grad = theta;

grad = ( X' * (sigmoid(X*theta) - y ) )/ m ;               

% =============================================================

end
