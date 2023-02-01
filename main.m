%Author: Adit Ghosh
%Advised by: Josh West, Frank Corsetti
%Email: aditghos@usc.edu; aditghosh94@gmail.com
%Project: Steady and non-steady state response of 10Be flux 
%%%%%%%%%%%
%%

%constants associated with 10Be calculation
% 
%

%Clean memory and screen
clear all
close all
clc

global eta;
global t;
global rho;
global BIG_LAMBDA_sp;
global BIG_LAMBDA_fm;
global BIG_LAMBDA_sm;
global lambda;
global P_sp;
global P_fm;
global P_sm;

x = (0:50:1000); %depth profile in 
X = 100;% Denudation depth for abrupt erosion change

eta = 3.9e-3;%cm/yr
t = 1e5;%yrs
rho = 1.4;%density in g/cm3
BIG_LAMBDA_sp = 160;% g/cm2 Attenuation legth spallation
BIG_LAMBDA_fm = 4439;% g/cm2 Attenuation legth fast muon
BIG_LAMBDA_sm = 1159;% g/cm2 Attenuation legth slow muon

lambda = 5e-7;%decay constant for 10 Be in 1/yrs
P_sp = 4.0459; %/g/yrs at 19JX site around 40 degree latitude 
P_fm = 0.0462; %/g/yrs
P_sm = 0.0997; %/g/yrs
%P=P0;

%Attenuation of 10Be

%P(x, eta, t) = P0.*exp(-rho .* x(eta, t)./BIG_LAMBDA); %Attenuation of Be 10 with depth
%x(eta, t) = ini_sample_depth - eta*t;
%Substituting

%C(x, eta, t) = C(x, 0) * exp(-lambda*t) + (P ./(lambda + (rho.*eta./BIG_LAMBDA))).* exp(rho.*x ./ BIG_LAMBDA) .* (1 - exp(-t.* (lambda + (rho.*eta./BIG_LAMBDA))));

%Model 1: At steady state, sample from top x=0 and long exposure time (Yang
%et al., 2022)
C_ss = func_ss();% %Assuming: Surface sample, no inheritence, and ignorable denudation 


% ******At non steady state************** 

%Model 2: Continuous exposure model: Accounts for inheritence (Yang et al.,
%2022)
C_cs = func_cexp(x);


%Model 3a: Changed in denudation rate due to climate, tectonics, megafauna
%extinction. Change in denudation rate e to E caused by last event t. (Yang
%et al., 2022)
E = 5e-3;%cm/yrs
C_allo = func_allo(x, E);

%Model 3b: Abrupt denudation event such as landslide that removes cm-m of
%material in short period. X is the denudation depth (Yang et al., 2022)
c_abrupt = func_abrupt(x, X);









