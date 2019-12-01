<<<<<<< HEAD
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

=======
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
>>>>>>> 7ee5696e83e2f1cf2264ae9194c0551d9faea39a
