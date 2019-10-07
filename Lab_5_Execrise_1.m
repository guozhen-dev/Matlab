clear all;clc;
syms t;
a = [1:0.1:2];
tlist=[0:0.05:5];
for i = 1:length(a)
    hold on ;
    p(t) = (1000/a(i)) * exp (0.5*a(i)*t);
    plist = p(tlist);
    plot(tlist,plist);
    %fplot (t,p);
end