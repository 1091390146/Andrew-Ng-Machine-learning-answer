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

 % ȡ��������c��������ֵ           �൱�ڽ�������� ת��Ϊ������ �� 3 ת��Ϊ 0  0  1  0  0  0  0  0 

%	end

%���� �����������Ҳ����ֱ�Ӷ�all_theta���в���;
initial_theta = zeros(n + 1, 1);

options = optimset('GradObj', 'on', 'MaxIter', 50);
 for c=1:num_labels

  %y==c����˼Ϊy����c��ֵ��ֵΪ1�������ڵĸ�ֵΪ0
  %all_theta(c,:) = fmincg(@(t)(lrCostFunction(t, X, (y==c), lambda)), all_theta(c,:)', options)';
  
  % ȡ��������c��������ֵ,�൱�ڽ�������� ת��Ϊ������ �� 3 ת��Ϊ 0  0  1  0  0  0  0  0  
  %�������൱��ת������ 0 1 �������⣬�൱�ڻ���һ���ߣ������ߵ����㣬�����������ϵĸ�������ȡֵ�ͻ����0����Ӧ��g(z)��������0.5  
  %��Ӧ�ģ�ѵ��������thetaΪ(10*401),��˼Ϊ1~10ÿ��ѵ�����˸������ʺϵ�theta��theta������401����ֵ����X�ж�Ӧ, ��X��СΪ(5000*401), 
  %����X*theta'�Ĵ�СΪ5000*10,��Ӧ��10�����ö�Ӧ1~10��
  %���罫3��Ϊ0 1 ��������ʱ,ͼ��Ϊ3��X����ֵ����ѵ��,����ֻ��3��������theta��˻�>0,��Ӧ��g(z)>0.5,����������˻�<0;
  %�������ÿһ�е����ֵ������ͼ��Ϊ3��ͼƬ����Ϊ��3��0 1����ѵ��������theta����ϣ�����������ֵ��󣬶�����������Ӧ��<0,���Ƕ�Ӧ���±�Ϊ3;
  %ע��,octave�±��Ǵ�1��ʼ��,0��Ӧ����10;

  initial_theta = fmincg(@(t)(lrCostFunction(t, X, (y==c), lambda)), initial_theta , options);
  all_theta(c,:) = initial_theta';

end





% =========================================================================


end
