clear all ;clc;
x1 = [0:5:20] ;
y1 = [200 152 118 93 74];
%plot ( x1, y1);
R = 5; 
xishu = polyfit ( x1 , y1 , R )
x2 = [0:0.1:20];
y2 = [zeros(1,201)];
for i = 1:R+1
	temp = xishu(i).*x2.^(R-i+1);
    y2 = y2 + temp;
end
% y2 = polyval (xishu, x2)
plot (x2, y2)