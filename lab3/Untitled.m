 [a, b] = interval(x1, x2, step);
x0 = a : step / 128 : b;
x0 = x0';
y0 = zeros(size(x0, 1), 1);
for j = 1 : size(x0, 1)
y0(j) = g(x0(j));
end
plot(x0, y0);
grid on;
hold on;
[a, b] = interval(x1, x2, step);
    x0 = a : step / 128 : b;
    x0 = x0';
    y0 = zeros(size(x0, 1), 1);
    for j = 1 : size(x0, 1)
        y0(j) = f(x0(j));
    end
    plot(x0, y0);