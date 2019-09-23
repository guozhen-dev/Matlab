clear all; clc;
syms t ;
f(t) = 3*t^2 + 1 ;
summ4 = 0;
summ8 = 0;
t4 = 0 ;
t8 = 0 ;
for i= 0:4
    summ4 = summ4 + f(i)*1;
end
for i=0:8
    summ8 = summ8 + f(i*0.5)*0.5;
end
fprintf('using 4 subintervals: %f\n',summ4);
fprintf('using 8 subintervals: %f',summ8);