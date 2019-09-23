clear all ;
syms t ;
h(t) = -2*(t-2)^3+3*(t-2)+1 ;
hp = diff(h)
hold on ;
fplot(h(t),[0 4]);
fplot(hp(t),[0 4]);
