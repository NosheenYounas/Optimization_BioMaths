function dX = ebola_rhs(t,X,p)
%
%  This m-file evaluates the right-hand side
%  of the EBOLA paper ODE system

% lambda = beta(1+neta.*H)./N;
% dSL = Lambda(1-P)-lambda.*SL-mu.*SL;
% dSH = Lambda.*P-psi_H.*lambda.*SH - mu.*SH;
% dE = lambda.*(SL+psi_H.*SH)-(alpha+mu).*E;
% dI = alpha.*E-(tau+theta_I+delta_I+mu).*I;
% dH = tau.*I-(theta_H+delta_H+mu).*H;
% dR = theta_I.*I+theta_H.*H-mu.*R;
  lambda = p(13).*(1+p(11).*X(5))./(X(1)+X(2)+X(3)+X(4)+X(5)+X(6));
dX = [p(1).*(1-p(2))-lambda.*X(1)-p(3).*X(1);
p(1).*p(2)-p(4).*lambda.*X(2) - p(3).*X(2);
lambda.*(X(1)+p(4).*X(2))-(p(5)+p(3)).*X(3);
p(5).*X(3)-(p(6)+p(7)+p(8)+p(3)).*X(4);
p(6).*X(4)-(p(9)+p(10)+p(3)).*X(5);
p(7).*X(4)+p(9).*X(5)-p(3).*X(6)];