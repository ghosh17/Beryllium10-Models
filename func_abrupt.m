%Model 3b
%Assuming: Surface sample, no inheritence, and ignorable denudation 
function [C] = func_abrupt(x, X, eta)

global lambda;
global P_sp; %Production spallation
global P_fm; %Production fast muon
global P_sm; %Production slow muon
global BIG_LAMBDA_sp; %effective attenuation lenght spallation
global BIG_LAMBDA_fm; %effective attenuation lenght fast muon
global BIG_LAMBDA_sm; %effective attenuation lenght slow muon
global rho; %density
%global eta; %erosion rate
global t; %exposure age


fprintf('\nAbrupt change in denudation rate\n')

%spallation
C_spallation = (P_sp .* exp(-rho*(x+X+eta.*t)./BIG_LAMBDA_sp) ./ (lambda + (rho.*eta./BIG_LAMBDA_sp))) .*exp(-lambda.*t) +  P_sp .* exp(-rho.*x./BIG_LAMBDA_sp) .* (1-exp(-t.*(lambda + (eta.*rho./BIG_LAMBDA_sp)))) ./(lambda + (rho.*eta./BIG_LAMBDA_sp));

%fast muon

C_fm = (P_fm .* exp(-rho*(x+X+eta.*t)./BIG_LAMBDA_fm) ./ (lambda + (rho.*eta./BIG_LAMBDA_fm))) .*exp(-lambda.*t) +  P_fm .* exp(-rho.*x./BIG_LAMBDA_fm) .* (1-exp(-t.*(lambda + (eta.*rho./BIG_LAMBDA_fm)))) ./(lambda + (rho.*eta./BIG_LAMBDA_fm));

%slow muon
C_sm = (P_sm .* exp(-rho*(x+X+eta.*t)./BIG_LAMBDA_sm) ./ (lambda + (rho.*eta./BIG_LAMBDA_sm))) .*exp(-lambda.*t) +  P_sm .* exp(-rho.*x./BIG_LAMBDA_sm) .* (1-exp(-t.*(lambda + (eta.*rho./BIG_LAMBDA_sm)))) ./(lambda + (rho.*eta./BIG_LAMBDA_sm));

%adding up all methods of 10Be production
C = C_spallation + C_fm + C_sm;

% fprintf('x = %f, \n', x);
fprintf('X (denudation depth = %f cm, \n', X);
fprintf('C = %f, \n', C);

figure(4)
plot(C,x)
% % set(gca,'Ydir','reverse')
title('Model 3b: Abrupt denudation event model');
xlabel('Concnetration of 10Be');
ylabel('Depth (cm)')
set(gca,'Ydir','reverse')
set(gca, 'FontSize', 18);


end