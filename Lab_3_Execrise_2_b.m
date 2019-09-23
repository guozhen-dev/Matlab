clear all; clc;
syms x ;
y = sqrt(24-2*x-x^2);
fprintf('%f',int(y,x,-6,4));
