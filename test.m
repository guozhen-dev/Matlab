% a plot of both investment
clear;close all
principle = 1;
r = 0.08;
m =2;
t = linspace(0,35,1000);
% plotting continuously compounded interest
future_continuous = principle.*exp(r.*t);
plot(t,future_continuous,'b-')
hold on
% plotting annually discretely compounded interest
n = 0;
future_discrete(1000) = [0];
for i = 1:length(t)
    if t(i) >= n && t(i) < n+0.5
       t0 = n;
       future_discrete(i) = principle*(1+r/m)^(m*t0);
    elseif abs(t(i) - (n+0.5)) < 1e-1
        t0 = n+0.5;
        n=t0;
        future_discrete(i) = principle*(1+r/m)^(m*t0);
    end
end
plot(t,future_discrete,'r-')
axis([0 35 0 20])
xlabel('Years')
ylabel('Dollars')
grid on