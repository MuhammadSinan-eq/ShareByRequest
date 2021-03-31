clear all; close all; clc;
%% parameters if any

%% Discretization
t_0 = 0;
t_end = 10;
n = 100;
h = (t_end-t_0)/n;
t = t_0:h:t_end;
y = ones(length(t), 1);
y(1) = 150;
%% Model Function
f = @(t, A) b-t*A(1);
%% Order of Equation
for alpha = 0.1:0.1:1.0
%% Scheme
for i = 2:length(1)-1
    t(i+1) = t(i) + h;
    y(i) = -y(i+1) - (1/(h*gamma(alpha)))*f(t(i), A(i))*( (2*h/alpha)*t(i+1)^alpha - (t(1+1)^(alpha+1))/(alpha+1) + (h/alpha)*t(i)^alpha - t(i)^(alpha+1)/alpha)...
        + (f(t(i-1), A(i-1))/h*gamma(alpha))*((h/alpha)*t(i+1)^alpha - ((t(i+1)^(alpha+1))/(alpha+1)) + (t(i)^alpha)/(alpha+1)) ;
end
%% Grahpics
tic;
figure(1)
txt = ['\alpha=' num2str(alpha)];
plot(t, y, '-','displayname', txt, 'linewidth', 2 ); 
hold on
xlabel('Time(Days)')
ylabel('y(t)')
lgd = legend;
lgd.NumColumns = 2;
title(lgd, 'Order of FDE, \alpha')
axis tight
toc;
end

