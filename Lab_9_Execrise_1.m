clear all; clc;
domain_x = [-2:0.1:2];
domain_y = [-2:0.1:2];
[X,Y] = meshgrid(domain_x,domain_y);
Z = X.*(exp(-X.^2-Y.^2));
surfc(X,Y,Z);
% above is the ans to a)
fprintf("Question 1 Completed, Press any key to continue...\n");
pause 
result_z1 = domain_x .* exp(-domain_x.^2 - 4);
result_z2 = domain_x .* exp(-domain_x.*2 ) ;
result_z3 = -1 .* exp(-1 - domain_y.^2);
hold on;
%plot (domain_x,Z(1,:),'r.');
plot ( domain_x, Z(1,:),'r');
plot ( domain_x, Z(3,:),'g');
plot ( domain_y, Z(:,2),'b');
fprintf("Question 2 Completed\n");
