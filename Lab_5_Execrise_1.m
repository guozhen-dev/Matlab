clear all;clc;
syms t;
a = [1:0.1:2];
for i = 1:length(a)
    hold on ;
    p(t) = (1000/a(i)) * exp (0.5*a(i)*t);
    fplot(p);
end

