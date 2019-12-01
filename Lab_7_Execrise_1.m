clear all; clc;
A = [16 -2 -4 0;
    -2 6 -2 0;
    -4 -2 4 6 ;
    0 0 -1 1;];
Coff=[6;
    0;
    0;
    3;];
rk_A=rank(A);
fprintf('%d',rk_A);
H = horzcat(A,Coff);
if rk_A < 4
    R = rref(H)
else 
    rref(H)
end

    

