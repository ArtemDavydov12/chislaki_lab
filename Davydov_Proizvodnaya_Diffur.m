%%
x = 0:0.01:2;
y = x.^3;
answ = 3*x.^2;
h = 1e-2;
dy = zeros();
for i = 2:length(x-1)
    dy(i) = (y(i) - y(i-1))/h;
end
plot(x, dy);
hold on;
plot(x,answ);
%% diffur 1 poryadka
x = 0:0.01:10;
answ = 2 * atan(tan(5/2)*exp(-x))+2*pi;
y(1) = 5;
h = 1e-2;
for i = 2 : length(x - 1)
    y(i) = y(i-1)-h*sin(y(i-1));
end 

plot(x, y);
hold on;
plot(x,answ);
%% diffur 2 poryadka
x = 0:0.001:10;
h = 1e-3;
y(1) = 1;
y(2) = y(1)+2*h;

for i = 2 : length(x) - 1
    y(i+1) = (h^2)*(((x(i))^2) - cos(x(i)*y(i))) - h*(sin(y(i))) * (y(i)-y(i-1)) + 2*y(i) - y(i-1);    
end
plot(x, y);
hold on;
%% SLAU 
h = 0.01;
x = 0:h:3;
y(1) = 1;
y(2) = y(1)+2*h;