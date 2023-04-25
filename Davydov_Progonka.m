A = [7 9 0 0; 2 5 8 0; 0 0 3 1; 0 0 5 2];
f = [7; 1; 4; 2];
b = [7;5;3;2];
a = [0; 2; 0; 5;];
c = [9; 8; 1; 0];
n = length(f);

beta = zeros(n-1, 1);
alpha = zeros(n-1, 1);

beta(1) = f(1)/b(1);
alpha(1) = -c(1)/b(1);

for i = 2 : n-1
    alpha(i) = -c(i)/(a(i)*alpha(i-1)+b(i));
    beta(i) = (f(i) - a(i)*beta(i-1))/(a(i)*alpha(i-1)+b(i));
end

x = zeros(n, 1);
x(n) = (f(n)-a(n)*beta(n-1))/(a(n)*alpha(n-1)+b(n));

for i = n-1:-1:1
    x(i) = alpha(i)*x(i+1)+beta(i);
end

k = A\f;