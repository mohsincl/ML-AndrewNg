function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta2, X, y, lambda) computes the cost of using
%   theta2 as the parameter for regularized logistic regression and the
%   gradient of the cost wrt to the parameters 

% Initialize some useful values
m = length(y); % number of training examples


% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta
%               You should set J to the cost
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost wrt each parameter in theta

%lambda = 0;

J =  - (1/m) .* sum(y .* (log(sigmoid(X*theta))) + (1-y) .* (log(1 - sigmoid(X*theta))) );



temp = theta; 
temp(1) = 0;
%printf("%d",lambda);
J = J + (lambda/(2*m)) .* sumsq(temp);

grad = (1/m) * sum((sigmoid(X*theta) - y) .* X);

grad =  grad + ((lambda/m) .* sum(temp));

%grad = grad(:);
% =============================================================

end
