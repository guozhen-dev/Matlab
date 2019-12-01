clear all; clc;
domain_xita = [0:0.05:pi/2];
domain_a = [0:0.1:10];
[XITA,A] = meshgrid(domain_xita, domain_a);
M = 500.* ( A.*sin(XITA) -5.*cos(XITA) );
surf(A,XITA,M);
xlabel('\theta');ylabel('a');zlabel('M');
fprintf("Question 1 Completed, Press any key to continue...\n");
pause 
hold on;
plot ( domain_a, M(:,1));
plot ( domain_xita, M(50,:));
plot ( domain_xita, M(101,:));
fprintf("Question 2 Completed, Press any key to continue...\n");
