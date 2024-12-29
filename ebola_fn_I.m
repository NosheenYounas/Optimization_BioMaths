function X = ebola_fn_I(p,tvec)

% This function numerically evaluates
%
% X(t) = [X1(t);X2(t);X3(t)]
%
% which satisfies the SEIR equation.
%
% lambda = beta(1+neta.*H)./N;
% dSL = Lambda(1-P)-lambda.*SL-mu.*SL;
% dSH = Lambda.*P-psi_H.*lambda.*SH - mu.*SH;
% dE = lambda.*(SL+psi_H.*SH)-(alpha+mu).*E;
% dI = alpha.*E-(tau+theta_I+delta_I+mu).*I;
% dH = tau.*I-(theta_H+delta_H+mu).*H;
% dR = theta_I.*I+theta_H.*H-mu.*R;

%
%
% 


[tvec,Xsoln] = ode23(@(t,Xsoln) ebola_rhs(t,Xsoln,p(1:13)),tvec,p(14:19));
X = Xsoln(:,4);% only keeping solved values of S
