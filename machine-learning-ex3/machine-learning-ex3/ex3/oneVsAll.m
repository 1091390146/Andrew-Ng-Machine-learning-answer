function [all_theta] = oneVsAll(X, y, num_labels, lambda)
%ONEVSALL trains multiple logistic regression classifiers and returns all
%the classifiers in a matrix all_theta, where the i-th row of all_theta 
%corresponds to the classifier for label i
%   [all_theta] = ONEVSALL(X, y, num_labels, lambda) trains num_labels
%   logistic regression classifiers and returns each of these classifiers
%   in a matrix all_theta, where the i-th row of all_theta corresponds 
%   to the classifier for label i

% Some useful variables
m = size(X, 1);
n = size(X, 2);

% You need to return the following variables correctly 
all_theta = zeros(num_labels, n + 1);

% Add ones to the X data matrix
X = [ones(m, 1) X];

% ====================== YOUR CODE HERE ======================
% Instructions: You should complete the following code to train num_labels
%               logistic regression classifiers with regularization
%               parameter lambda. 
%
% Hint: theta(:) will return a column vector.
%
% Hint: You can use y == c to obtain a vector of 1's and 0's that tell you
%       whether the ground truth is true/false for this class.
%
% Note: For this assignment, we recommend using fmincg to optimize the cost
%       function. It is okay to use a for-loop (for c = 1:num_labels) to
%       loop over the different classes.
%
%       fmincg works similarly to fminunc, but is more efficient when we
%       are dealing with large number of parameters.
%
% Example Code for fmincg:
%
%     % Set Initial theta
%     initial_theta = zeros(n + 1, 1);
%     
%     % Set options for fminunc
%     options = optimset('GradObj', 'on', 'MaxIter', 50);
% 
%     % Run fmincg to obtain the optimal theta
%     % This function will return theta and the cost 
%     [theta] = ...
%         fmincg (@(t)(lrCostFunction(t, X, (y == c), lambda)), ...
%                 initial_theta, options);
%

%options = optimset('GradObj', 'on', 'MaxIter', 50);
%	for c = 1:num_labels
%		all_theta(x,:) = fmincg(@(t)(lrCostFunction(t,X,(y == c), lambda)), all_theta(c,:),options);

 % 取出向量第c行所有数值           相当于将类别数字 转化为向量。 如 3 转化为 0  0  1  0  0  0  0  0 

%	end

%可以 用这个方法，也可以直接对all_theta进行操作;
initial_theta = zeros(n + 1, 1);

options = optimset('GradObj', 'on', 'MaxIter', 50);
 for c=1:num_labels

  %y==c的意思为y等于c的值赋值为1，不等于的赋值为0
  %all_theta(c,:) = fmincg(@(t)(lrCostFunction(t, X, (y==c), lambda)), all_theta(c,:)', options)';
  
  % 取出向量第c行所有数值,相当于将类别数字 转化为向量。 如 3 转化为 0  0  1  0  0  0  0  0  
  %这样就相当于转换成了 0 1 分类问题，相当于画了一条线，这条线等于零，大于这条线上的各个特征取值就会大于0，对应的g(z)函数大于0.5  
  %对应的，训练出来的theta为(10*401),意思为1~10每个训练出了各自最适合的theta，theta向量有401个数值，与X列对应, 而X大小为(5000*401), 
  %所以X*theta'的大小为5000*10,对应的10列正好对应1~10，
  %比如将3化为0 1 分类问题时,图像为3的X特征值参与训练,于是只有3的特征与theta相乘会>0,对应的g(z)>0.5,而其他的相乘会<0;
  %于是求出每一行的最大值，比如图像为3的图片，因为跟3的0 1分类训练出来的theta最拟合，因此与其相乘值最大，而其他的理论应该<0,于是对应的下标为3;
  %注意,octave下标是从1开始的,0对应的是10;

  initial_theta = fmincg(@(t)(lrCostFunction(t, X, (y==c), lambda)), initial_theta , options);
  all_theta(c,:) = initial_theta';

end





% =========================================================================


end
