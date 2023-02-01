%Model 3b
%Assuming: Surface sample, no inheritence, and ignorable denudation 
function [C] = func_abrupt(x, X)

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

fprintf('\nConstant exposure\n')
%spallation
C_spallation = (P_sp .* exp(-rho*(x+X+eta.*t)./BIG_LAMBDA_sp) ./ (lambda + (rho.*eta./BIG_LAMBDA_sp))) .*exp(-lambda.*t) +  P_sp .* exp(-rho.*x./BIG_LAMBDA_sp) .* (1-exp(-t.*(lambda + (eta.*rho./BIG_LAMBDA_sp)))) ./(lambda + (rho.*eta./BIG_LAMBDA_sp));

%fast muon

C_fm = (P_fm .* exp(-rho*(x+X+eta.*t)./BIG_LAMBDA_fm) ./ (lambda + (rho.*eta./BIG_LAMBDA_fm))) .*exp(-lambda.*t) +  P_fm .* exp(-rho.*x./BIG_LAMBDA_fm) .* (1-exp(-t.*(lambda + (eta.*rho./BIG_LAMBDA_fm)))) ./(lambda + (rho.*eta./BIG_LAMBDA_fm));

%slow muon
C_sm = (P_sm .* exp(-rho*(x+X+eta.*t)./BIG_LAMBDA_sm) ./ (lambda + (rho.*eta./BIG_LAMBDA_sm))) .*exp(-lambda.*t) +  P_sm .* exp(-rho.*x./BIG_LAMBDA_sm) .* (1-exp(-t.*(lambda + (eta.*rho./BIG_LAMBDA_sm)))) ./(lambda + (rho.*eta./BIG_LAMBDA_sm));

%adding up all methods of 10Be production
C = C_spallation + C_fm + C_sm;

fprintf('x = %f, \n', x);
fprintf('X (denudation depth = %f, \n', X);
fprintf('C = %f, \n', C);

figure(4)
plot(C,x)
% % set(gca,'Ydir','reverse')
title('Model 3b: Abrupt denudation event model');
xlabel('Concnetration of 10Be');
ylabel('Depth (cm)')
set(gca,'Ydir','reverse')

end