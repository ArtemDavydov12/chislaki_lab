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
%% y" + sin(x) * y' + y * cos(x) = sin(x)
h = 0.01;
x = 0:h:1;
b = zeros();
f = zeros();
c = zeros();
a = zeros();
y(1) = 1;
y(length(x)) = 2;

b(1) = (-2/h^2)+(sin(x(1))/h)+cos(x(1));
c(1) = 1/h^2;
a(1) = (1/h^2)-(sin(x(1))/h);
f(1) = sin(x(1))-y(1)/h^2+y(1)*sin(x(1))/h;

for i = 2 : length(x) - 2
    
    b(i) = (-2/h^2)+(sin(x(i))/h)+cos(x(i));
    c(i) = 1/h^2;
    a(i) = (1/h^2)-(sin(x(i))/h);
    f(i) = sin(x(i));
end

b(length(x)-1) = (-2/h^2)+(sin(x(length(x)-1))/h)+cos(x(length(x)-1));
c(length(x)-1) = 1/h^2;
a(length(x)-1) = (1/h^2)-(sin(x(length(x)-1))/h);
f(length(x)-1) = sin(x(length(x)-1))-2/h^2;

n = length(f);
beta = zeros(n-1, 1);
alpha = zeros(n-1, 1);

beta(1) = f(1)/b(1);
alpha(1) = -c(1)/b(1);

for i = 2 : n-1
    alpha(i) = -c(i)/(a(i)*alpha(i-1)+b(i));
    beta(i) = (f(i) - a(i)*beta(i-1))/(a(i)*alpha(i-1)+b(i));
end

y(n) = (f(n)-a(n)*beta(n-1))/(a(n)*alpha(n-1)+b(n));

for i = n-1:-1:2
    y(i) = alpha(i)*y(i+1)+beta(i);
end
plot(x, y);