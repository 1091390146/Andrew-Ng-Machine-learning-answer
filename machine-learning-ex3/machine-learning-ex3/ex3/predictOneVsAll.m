function p = predictOneVsAll(all_theta, X)
%PREDICT Predict the label for a trained one-vs-all classifier. The labels 
%are in the range 1..K, where K = size(all_theta, 1). 
%  p = PREDICTONEVSALL(all_theta, X) will return a vector of predictions
%  for each example in the matrix X. Note that X contains the examples in
%  rows. all_theta is a matrix where the i-th row is a trained logistic
%  regression theta vector for the i-th class. You should set p to a vector
%  of values from 1..K (e.g., p = [1; 3; 1; 2] predicts classes 1, 3, 1, 2
%  for 4 examples) 

m = size(X, 1);
num_labels = size(all_theta, 1);

% You need to return the following variables correctly 
p = zeros(size(X, 1), 1);

% Add ones to the X data matrix
X = [ones(m, 1) X];

% ====================== YOUR CODE HERE ======================
% Instructions: Complete the following code to make predictions using
%               your learned logistic regression parameters (one-vs-all).
%               You should set p to a vector of predictions (from 1 to
%               num_labels).
%
% Hint: This code can be done all vectorized using the max function.
%       In particular, the max function can also return the index of the 
%       max element, for more information see 'help max'. If your examples 
%       are in rows, then, you can use max(A, [], 2) to obtain the max 
%       for each row.
%       


  % ȡ��������c��������ֵ,�൱�ڽ�������� ת��Ϊ������ �� 3 ת��Ϊ 0  0  1  0  0  0  0  0  
  %�������൱��ת������ 0 1 �������⣬�൱�ڻ���һ���ߣ������ߵ����㣬�����������ϵĸ�������ȡֵ�ͻ����0����Ӧ��g(z)��������0.5  
  %��Ӧ�ģ�ѵ��������thetaΪ(10*401),��˼Ϊ1~10ÿ��ѵ�����˸������ʺϵ�theta��theta������401����ֵ����X�ж�Ӧ, ��X��СΪ(5000*401), 
  %����X*theta'�Ĵ�СΪ5000*10,��Ӧ��10�����ö�Ӧ1~10��
  %���罫3��Ϊ0 1 ��������ʱ,ͼ��Ϊ3��X����ֵ����ѵ��,����ֻ��3��������theta��˻�>0,��Ӧ��g(z)>0.5,����������˻�<0;
  %�������ÿһ�е����ֵ������ͼ��Ϊ3��ͼƬ����Ϊ��3��0 1����ѵ��������theta����ϣ�����������ֵ��󣬶�����������Ӧ��<0,���Ƕ�Ӧ���±�Ϊ3;
  %ע��,octave�±��Ǵ�1��ʼ��,0��Ӧ����10;

[maxVal, index] = max(X * all_theta', [], 2);
%  max (X, [], DIM)
%  dim��ʾά�������x��һ������Ļ���dimȡ1��ʾ����������и��е����ֵ��dimȡ2��ʾ����������и��е����ֵ��
p = index;




% =========================================================================


end
