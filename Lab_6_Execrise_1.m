clear all;clc;
%plugin the weigh here
weigh = 5 ;
v0 = 10;
syms angel_of_launch;
syms v0_x;
syms v0_y;
v0_y= v0*sin(angel_of_launch);
syms v ;
syms t;
v = v0_y - 9.81*t;
h = int(v,t);
syms rubbish;
solve_list = solve(h==0,t);
s = v0_x * solve_list(2,:);
syms s_p;
s_p = diff (s);
solve(s_p==0, angel_of_launch)

fprintf("%d",ans*180/pi);




