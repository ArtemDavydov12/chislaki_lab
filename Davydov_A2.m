%% 6 spline ^3
x = [0,1, 2, 3, 4, 5, 6];
y = [1.5, 1.8, 2, 2.1, 1.4, 0.9, 0.7];
c = zeros(1, length(x)-1);
d = zeros(1, length(x)-1);
c(2) = 0;
d(2) = 0;
h = 1;
for i =  2:length(y) - 1
    d(i+1) = d(i)- (6/h)*c(i)+(6/h^3)*(y(i+1)-2*y(i)+y(i-1));
    c(i+1) = c(i)+ h*d(i+1);
end
xarr=[];
yarr=[];
for j = 2:length(x) - 1
    xf = x(j):(x(j+1)-x(j))/100:x(j+1);
    yf = y(j)+ ((y(j)-y(j-1))/h +(c(j)/2)*h-(d(j)/6)*h^2)*(xf-x(j))+(c(j)/2)*(xf-x(j)).^2 + (d(j)/6)*(xf-x(j)).^3;
    xarr = [xarr xf];
    yarr = [yarr yf];
end
plot(xarr, yarr);
hold on;
plot(x, y, 'o');