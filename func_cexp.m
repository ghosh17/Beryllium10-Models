%Model 2
%Assuming: Surface sample, no inheritence, and ignorable denudation 
function [C] = func_cexp(x)

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
C_spallation = P_sp ./(lambda + (eta.*rho./BIG_LAMBDA_sp)) .* (exp(-rho .* x ./ BIG_LAMBDA_sp)) .* (1-exp(-t.*(lambda + (eta.*rho./BIG_LAMBDA_sp))));

%fast muon

C_fm = P_fm ./(lambda + (eta.*rho./BIG_LAMBDA_fm)) .* (exp(-rho.*x./BIG_LAMBDA_fm)) .* (1-exp(-t.*(lambda + (eta.*rho./BIG_LAMBDA_fm))));

%slow muon
C_sm = P_sm ./(lambda + (eta.*rho./BIG_LAMBDA_sm)) .* (exp(-rho.*x./BIG_LAMBDA_sm)) .* (1-exp(-t*(lambda + (eta.*rho./BIG_LAMBDA_sm))));

%adding up all methods of 10Be production
C = C_spallation + C_fm + C_sm;

% fprintf('x = %f, \n', x);
% fprintf('eta = %f, \n', eta);
fprintf('C = %f, \n', C);

figure(2)
plot(C,x)
% % set(gca,'Ydir','reverse')
title('Model 2: Continuous exposure');
xlabel('Concnetration of 10Be');
ylabel('Depth (cm)')
set(gca,'Ydir','reverse')
set(gca, 'FontSize', 18);


end