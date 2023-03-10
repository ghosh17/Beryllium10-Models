%Model 1
%Assuming: Surface sample, no inheritence, and ignorable denudation 
function [C] = func_ss(x, eta)

global lambda;
global P_sp;
global P_fm;
global P_sm;
global BIG_LAMBDA_sp;
global BIG_LAMBDA_fm;
global BIG_LAMBDA_sm;
global rho;
%global eta;

fprintf('\nSteady State \n')
%spallation
C_spallation = P_sp ./(lambda+(rho.*eta./BIG_LAMBDA_sp)) .* (exp(-rho.*x./BIG_LAMBDA_sp));

%fast muon

C_fm = P_fm ./(lambda+(rho.*eta./BIG_LAMBDA_fm)) .* (exp(-rho.*x./BIG_LAMBDA_fm));

%slow muon
C_sm = P_sm ./(lambda+(rho.*eta./BIG_LAMBDA_sm)) .* (exp(-rho.*x./BIG_LAMBDA_sm));

%adding up all methods of 10Be production
C = C_spallation + C_fm + C_sm;

fprintf('C= %f \n', C);
figure(1)
plot(C,x);
set(gca, 'FontSize', 18);
set(gca,'Ydir','reverse')
title('Model 1: Steady state');
xlabel('Concnetration of 10Be');
ylabel('Depth (cm)')

end