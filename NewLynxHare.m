% NewLynxHare.m
%
% This m-file does parameter estimation for the Hudson Bay Company's
% Lynx-Hare data set using the predator-prey model
%
%  dX1/dt =  b(1)*X1 - b(2)*X1*X2
%  dX2/dt = -b(4)*X2 + b(3)*X1*X2
%  X1(0) = b(5), X2(0) = b(6) 
clear all, close all

%% starting with Hare only


%--------------------------------------------------------------------------
% Input data and other problem dependent functions and parameters.
%--------------------------------------------------------------------------
H = [30 47.2 70.2 77.4 36.3 20.6 18.1 21.4 22 25.4 27.1 ...
        40.3 57 76.6 52.3 19.5 11.2 7.6 14.6 16.2 24.7]'; %Hare
    L = [4 6.1 9.8 35.2 59.4 41.7 19 13 8.3 9.1 7.4 ...
        8 12.3 19.5 45.7 51.1 29.7 15.8 9.7 10.1 8.6]'; %Lynx
yvec = H; 
tvec=[1:21]'; % defining time

nlin_fn_H = @lynxhare_fn_H;
nlin_fn_L = @lynxhare_fn_L;
b_0 = [.47; .024; .023; .76; 30; 4]; 


%--------------------------------------------------------------------------
% Compute optimal parameter values using nlinfit and plot.
%--------------------------------------------------------------------------

b_opt = nlinfit(tvec,yvec,nlin_fn_H,b_0);% optimizing the vulues of b by 
% using nlin_fn_L for Hare data


model_opt_H = feval(nlin_fn_H,b_opt,tvec); %calculation model Hare
model_opt_L = feval(nlin_fn_L,b_opt,tvec); %calculation model lynx


figure(1)
  subplot(211)
    plot(tvec,yvec,'o',tvec,model_opt_H,'k')
    title('Data and Model Fit: Hare')
  subplot(212)
    plot(tvec,L,'o',tvec,model_opt_L,'k')
    title('Model: Linx')

%% Now Lynx only


yvec = L;
tvec=[1:21]'; % time

nlin_fn_H = @lynxhare_fn_H;
nlin_fn_L = @lynxhare_fn_L;
b_0 = [.47; .024; .023; .76; 30; 4]; 


%--------------------------------------------------------------------------
% Compute optimal parameter values using nlinfit and plot.
%--------------------------------------------------------------------------

b_opt = nlinfit(tvec,yvec,nlin_fn_L,b_0); % optimizing the vulues of b by 
% using nlin_fn_L for lynx data


model_opt_H = feval(nlin_fn_H,b_opt,tvec); %calculation model Hare
model_opt_L = feval(nlin_fn_L,b_opt,tvec); %calculation model lynx


figure(2)
  subplot(211)
    plot(tvec,H,'o',tvec,model_opt_H,'k')
    title('Model: Hare')
  subplot(212)
    plot(tvec,yvec,'o',tvec,model_opt_L,'k')
    title('Data and Model Fit: Linx')
    
    
    
    