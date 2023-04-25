%% 2
x = [0, 1, 2, 3, 4];
y = [0.91, 0.15, 0.02, 0.0025, 0.0003];
g = 0:0.1:5;
F = zeros(1,length(g));
A = zeros(1, length(g));
for k = 1:length(g)
    C1=sum(y.*exp(x*(-g(k))));
    C2=sum(exp(x*(-2*g(k))));
    C3=sum(x.*exp(x*(-2*g(k))));
    C4=sum((x.*y).*exp(x*(-g(k))));
    F(k) = C1*C3-C2*C4;
    for i = 2:length(g)
        if F(i)*F(i-1)<0
            rootgamma=(g(i)+g(i-1))/2;
        end             
    end
    A=sum((exp((-rootgamma)*x).*y)/sum(exp((-2*rootgamma)*x)));
    x_real=[0:0.1:5];
    y_real=A*exp(-rootgamma.*x_real);
end
plot(x,y,'o');
hold on;
plot(x_real,y_real);
%% 3
x = [0,1, 2, 3, 4, 5, 6];
y = [1.5, 1.8, 2, 2.1, 1.4, 0.9, 0.7];
n = 7;
B = y.';
A = zeros(n);
for i = 1:n
    for j = 1:n
        A(i,j)=(x(i)^(j-1));
        
    end
end
a = A^(-1)*B;
plot(x,y);
%% 4 Spline
x = [0,1, 2, 3, 4, 5, 6];
y = [1.5, 1.8, 2, 2.1, 1.4, 0.9, 0.7];
for i = 1:length(x)
    for j = 1:length(x)
        mat_x(i, j) = cos((j-1)*x(i));
    end   
end

x_real = [1:0.1:6];
plot(x, y, 'o');
hold on;
plot(x, y_real);
%% 5 spline square
x = 1:1: 100;
y = rand(1,length(x));
c = zeros(1, length(x)-1);
h = 1;
c(1) = 0;
for i =  2:length(y)-1
    c(i) = 1/(h^2)*(y(i+1)- 2*y(i)+y(i-1))-c(i-1);
end
xarr = [];
yarr = [];
for j = 1 : length(x) - 1
    xlim_1 = x(j);
    xlim_2 = x(j+1);
    ylim_1 = y(j);
    ylim_2 = y(j+1);
    stepx = xlim_1 : (xlim_2-xlim_1)/100 : xlim_2;
    stepy = ylim_1+(ylim_2-ylim_1)*(stepx-xlim_1)/(xlim_2-xlim_1)+c(j)*(stepx-xlim_1).*(stepx-xlim_2);
    xarr = [xarr stepx];
    yarr = [yarr stepy];
end
plot(xarr, yarr);
hold on;
plot(x, y, 'o');
%% 6 spline ^3
x = [0,1, 2, 3, 4, 5, 6];
y = [1.5, 1.8, 2, 2.1, 1.4, 0.9, 0.7];
c = zeros(1, length(x)-1);
d = zeros(1, length(x)-1);
c(1) = 0;
d(1) = 0;
for i =  2:length(y)-1
    c(i+1) = c(i)+ h*d(i+1);
    d(i+1) = d(i)- (6/R)*c(i)+(6/R^3)*(y(i+1)-2y(i)+y(i-1));