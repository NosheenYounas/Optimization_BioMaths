function X = lynxhare_fn_H(b,tvec)

% This function numerically evaluates
%
% X(t) = [X1(t);X2(t)]
%
% which satisfies the predator-prey equation.
%
%  dX1/dt =  b(1)*X1 - b(2)*X1*X2
%  dX2/dt = -b(4)*X2 + b(3)*X1*X2
%  X1(0) = b(5), X2(0) = b(6).
% 

%tvec = tvec(1:length(tvec)/2);
[tvec,Xsoln] = ode23(@(t,Xsoln) lynxhare_rhs(t,Xsoln,b(1:4)),tvec,[b(5); b(6)]);
X = Xsoln(:,1);% only keeping solved values of Hare
