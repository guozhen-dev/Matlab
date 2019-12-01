clear all; clc;
syms t;
v(t) = 14.4*(1-exp(-t/2.72));
fplot(v,[0,5]);
s(t) = int(v);
hold on ;
fplot(s-s(0),[0,5]);
time = solve(s(t)==100, t );
fprintf('time: %d, speed: %d',time, v(time))
pause
clear all ; clc ;close all; 
load census;
plot(cdate, pop);
pause 
clear all ; clc; close all ;

