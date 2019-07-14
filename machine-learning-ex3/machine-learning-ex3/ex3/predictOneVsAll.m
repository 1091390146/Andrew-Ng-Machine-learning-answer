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


  % 取出向量第c行所有数值,相当于将类别数字 转化为向量。 如 3 转化为 0  0  1  0  0  0  0  0  
  %这样就相当于转换成了 0 1 分类问题，相当于画了一条线，这条线等于零，大于这条线上的各个特征取值就会大于0，对应的g(z)函数大于0.5  
  %对应的，训练出来的theta为(10*401),意思为1~10每个训练出了各自最适合的theta，theta向量有401个数值，与X列对应, 而X大小为(5000*401), 
  %所以X*theta'的大小为5000*10,对应的10列正好对应1~10，
  %比如将3化为0 1 分类问题时,图像为3的X特征值参与训练,于是只有3的特征与theta相乘会>0,对应的g(z)>0.5,而其他的相乘会<0;
  %于是求出每一行的最大值，比如图像为3的图片，因为跟3的0 1分类训练出来的theta最拟合，因此与其相乘值最大，而其他的理论应该<0,于是对应的下标为3;
  %注意,octave下标是从1开始的,0对应的是10;

[maxVal, index] = max(X * all_theta', [], 2);
%  max (X, [], DIM)
%  dim表示维数。如果x是一个矩阵的话，dim取1表示找这个矩阵中各列的最大值，dim取2表示找这个矩阵中各行的最大值。
p = index;




% =========================================================================


end
