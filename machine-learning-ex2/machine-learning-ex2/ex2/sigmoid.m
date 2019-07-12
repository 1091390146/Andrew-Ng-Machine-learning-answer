function g = sigmoid(z)
%SIGMOID Compute sigmoid function
%   g = SIGMOID(z) computes the sigmoid of z.

% You need to return the following variables correctly 
g = zeros(size(z));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the sigmoid of each value of z (z can be a matrix,
%               vector or scalar).

%自己之前代码，运行没问题，从网上发现简单代码，不过这都不是事，明白思路，工具问题
%for i = 1 : size(g,1)
%	for j = 1 : size(g,2)
%		g(i,j) = 1/(1+exp(-z(i,j)));
%	end
%end


g = 1 ./ ( 1 + exp(-z) ) ;

% =============================================================

end
