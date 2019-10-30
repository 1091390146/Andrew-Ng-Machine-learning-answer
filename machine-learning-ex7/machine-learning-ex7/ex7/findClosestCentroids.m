function idx = findClosestCentroids(X, centroids)
%FINDCLOSESTCENTROIDS computes the centroid memberships for every example
%   idx = FINDCLOSESTCENTROIDS (X, centroids) returns the closest centroids
%   in idx for a dataset X where each row is a single example. idx = m x 1 
%   vector of centroid assignments (i.e. each entry in range [1..K])
%

% Set K
K = size(centroids, 1);

% You need to return the following variables correctly.
idx = zeros(size(X,1), 1);

% ====================== YOUR CODE HERE ======================
% Instructions: Go over every example, find its closest centroid, and store
%               the index inside idx at the appropriate location.
%               Concretely, idx(i) should contain the index of the centroid
%               closest to example i. Hence, it should be a value in the 
%               range 1..K
%
% Note: You can use a for-loop over the examples to compute this.
%


%这个逻辑比较清晰
%两行遍历，第一个loop遍历所有数据，第二个遍历1~K，记录数据点到那个质心最近 idx(i) = mark
m = size(X,1);

for i =1:m
    compare = 1000000;
    for j = 1:K
        distant = X(i,:) - centroids(j,:);
        distant = sum(distant .^ 2);
        if distant < compare
            compare = distant;
            mark = j;
        end
    end
    idx(i) = mark;
end

%value=zeros(K,1);
%for i=1:size(X,1)
%    for j=1:K
%        value(j)=sum((X(i,:)-centroids(j,:)) .^ 2);
%    end
%    [val,ind]=min(value);
%    idx(i)=ind;
%end 




% =============================================================

end

