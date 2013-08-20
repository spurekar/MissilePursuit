clear all;
clc; clf;
 
t=linspace(0,1.5*pi,500);
y=2*cos(-t);
x=2*sin(-3*t);
 
[t,Y]=ode45('interceptor',[0,1.5*pi],[0;0],[],0.9);
 
plot(x,y,'b',Y(:,1),Y(:,2),'r');
legend('Missile','Interceptor');
title('Missile vs. Interceptor')
xlabel('x')
ylabel('y')


function Yprime=interceptor(t,y,~,k)
Yprime = zeros(2,1);
 
Q=2*cos(-t);
P=2*sin(-3*t);
 
dQ=2*sin(-t);
dP=-6*cos(-3*t);
 
Yprime(1)= k * (sqrt((dP)^2 + (dQ)^2) * (P - y(1))) / (sqrt((P - y(1))^2 + (Q - y(2))^2));
Yprime(2)= k * (sqrt((dP)^2 + (dQ)^2) * (Q - y(2))) / (sqrt((P - y(1))^2 + (Q - y(2))^2));
