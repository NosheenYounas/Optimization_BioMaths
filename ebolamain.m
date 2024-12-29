%SEIR.m
%model equations are given in paper
%and data has been estimated from graph
clc; clear all

t = [1 50 100 125.7 150 171.43 200 218.6 235 248.3 250 259.14 269.71 277.85 287.143]';
I_data = [10 106.06 333.3 500 736.4 1000 1500 2000 2500 3000 3090 3500 4000 4500 5000]';


%-------------------------------------------------------
psi_H = 1.2; %1.2 to 2
delta_I = 0.1;
delta_H = 0.5;
theta_I = 0.1;
theta_H = 0.2;
alpha = 0.1;
tau = 0.16;
Lambda = 1.7;
P = 0.2;
beta = 0.5; % this is to be estimated
mu = 1/63;
neta = 0.6;% 0.6 to 0.8
N = 1E6+20000+25;

I_0 = I_data(1);
SL_0 = 1E6;
SH_0 = 20000;
E_0 = 15;
H_0 = 0;
R_0 = 0;
p = [Lambda;P;mu;psi_H;alpha;tau; theta_I;delta_I;theta_H;delta_H;neta;N;beta; SL_0;SH_0;E_0;I_0;H_0;R_0]; %parameters in differential equation

%% Now optimizing parameters with I data only
tvec = t;

yvec = I_data;
p_opt = nlinfit(tvec,yvec,@ebola_fn_I,p);


%computing S, E and I using optimized parameters

model_opt_I = feval(@ebola_fn_I,p_opt,tvec);

%plotting results

figure; plot(tvec,I_data,'o',tvec,model_opt_I,'k'); 
title('I calculated using I data for optimization'); 
xlabel('time');ylabel('population')

