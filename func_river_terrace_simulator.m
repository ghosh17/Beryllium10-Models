function [] = func_river_terrace_simulator(C_ss, C_ss_2, C_cs, C_allo, c_abrupt);


Be_strat(1) = C_ss(1);
Be_strat(2) = c_abrupt(1);
Be_strat(3) = C_ss(1);

figure(5)
hold on
plot(Be_strat);
ylabel('[10Be]')
xlabel('time')
title('Case 1: Abrupt change')
set(gca, 'FontSize', 18);
hold off

figure(6)
hold on
Be_strat_2(1) = C_ss(1);
Be_strat_2(2) = C_allo(1);
Be_strat_2(3) = C_ss_2(1);
ylabel('[10Be]')
xlabel('time')
title('Case 2: Allocyclic change')
set(gca, 'FontSize', 18);
plot(Be_strat_2);
hold off

end