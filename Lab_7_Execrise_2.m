clear all; clc;
p = 90e3;
A = 0.0004;
syms d;
syms L;
syms F;
syms delta_L;

Lis = [75e9 2740; 209e9 8890;197e9 7850];
for i = 1:3
    for d = 0:0.5:16
     E = Lis(i,1);
     delta_L(L) = L/(E*A); 
     delta_L_F(L,F) = L*F/(E*A);
     Coff = [1 1 1;
         0 10 16 ;
         6*delta_L(4) -16*delta_L(5) 10*delta_L(2);];
     Cons = [p; d*p; 0];
     x_ans = Coff\Cons;
     if (delta_L_F(4,x_ans(1))<1e-3 || delta_L_F(6,x_ans(2))<1e-3 || delta_L_F(2,x_ans(3))<1e-3 )
         fprintf('get!\n');
     end
    end
end


