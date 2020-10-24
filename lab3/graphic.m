x0 = -4*pi : pi/180 : 1.5*pi;
x0 = x0';
y0 = zeros(size(x0, 1), 1);
for i = 1 : size(x0, 1)
    y0(i) = f(x0(i));
end
hold on;
grid on;
title('f(x)=cos^2(x)-0.1e^x');
xlabel('x');
ylabel('y');
plot(x0, y0);
plot([-13 5], [0 0], 'k');
plot([0 0], [-11 1], 'k');