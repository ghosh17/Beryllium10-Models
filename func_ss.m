%Model 1
%Assuming: Surface sample, no inheritence, and ignorable denudation 
function [C] = func_ss()

global lambda;
global P_sp;
global P_fm;
global P_sm;
global t;

%spallation
C_spallation = (P_sp ./lambda) .* (1-exp(-lambda.*t));

%fast muon

C_fm = (P_fm ./lambda) .* (1-exp(-lambda.*t));

%slow muon
C_sm = (P_sm ./lambda) .* (1-exp(-lambda.*t));

%adding up all methods of 10Be production
C = C_spallation + C_fm + C_sm;

fprintf('Concnetration at top of soil horizon %f \n', C);
% figure(1)
% 
% % set(gca,'Ydir','reverse')
% title('Model 1: Steady state');
% xlabel('Concnetration of 10Be');
% ylabel('Depth (cm)')

end