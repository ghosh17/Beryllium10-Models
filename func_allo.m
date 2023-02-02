%Model 3a
%Assuming: Surface sample, no inheritence, and ignorable denudation 
function [C] = func_allo(x, E)

global lambda;
global P_sp;
global P_fm;
global P_sm;
global BIG_LAMBDA_sp;
global BIG_LAMBDA_fm;
global BIG_LAMBDA_sm;
global rho;
global eta;
global t;


fprintf('\nAllogenic change in denudation rate\n')


%spallation
C_spallation = (P_sp .* exp(-rho*(x+eta.*t)./BIG_LAMBDA_sp) ./ (lambda + (rho.*E./BIG_LAMBDA_sp))) .*exp(-lambda.*t) +  P_sp .* exp(-rho.*x./BIG_LAMBDA_sp) .* (1-exp(-t.*(lambda + (eta.*rho./BIG_LAMBDA_sp)))) ./(lambda + (rho.*eta./BIG_LAMBDA_sp));

%fast muon

C_fm = (P_fm .* exp(-rho*(x+eta.*t)./BIG_LAMBDA_fm) ./ (lambda + (rho.*E./BIG_LAMBDA_fm))) .*exp(-lambda.*t) +  P_fm .* exp(-rho.*x./BIG_LAMBDA_fm) .* (1-exp(-t.*(lambda + (eta.*rho./BIG_LAMBDA_fm)))) ./(lambda + (rho.*eta./BIG_LAMBDA_fm));

%slow muon
C_sm = (P_sm .* exp(-rho*(x+eta.*t)./BIG_LAMBDA_sm) ./ (lambda + (rho.*E./BIG_LAMBDA_sm))) .*exp(-lambda.*t) +  P_sm .* exp(-rho.*x./BIG_LAMBDA_sm) .* (1-exp(-t.*(lambda + (eta.*rho./BIG_LAMBDA_sm)))) ./(lambda + (rho.*eta./BIG_LAMBDA_sm));

%adding up all methods of 10Be production
C = C_spallation + C_fm + C_sm;

% fprintf('x = %f, \n', x);
% fprintf('eta = %f, \n', eta);
fprintf('\nE = Change in denudation rate e to E caused by last event t = %f cm/yrs\n', E);
fprintf('C = %f, \n', C);

figure(3)
plot(C,x)
% % set(gca,'Ydir','reverse')
title('Model 3a: Changed denudation model');
xlabel('Concnetration of 10Be');
ylabel('Depth (cm)')
set(gca,'Ydir','reverse')
set(gca, 'FontSize', 18);

end