function [x, t, h, error, p] = rk(x0, a, b, eps)
    p = 0;
    n = 2;
    flag = false;
    while ~flag
        flag = true;
        n = n * 2;
        h = (b - a) / n;
        p = p + 3;
        x(1) = x0;
        for i = 1 : n
            k1 = h*dx(x(i), a + (i - 1)*h);
            k2 = h*dx(x(i) + 0.5*k1, a + (i - 0.5)*h);
            k3 = h*dx(x(i) + 0.5*k2, a + (i - 0.5)*h);
            k4 = h*dx(x(i) + k3, a + i*h);
            x(i + 1) = x(i) + (k1 + 2*k2 + 2*k3 + k4)/6;
            o = abs((k2 - k3)/(k1 - k2));
            p = p + 29;
            if o >= eps
                flag = false;
                break;
            end
        end
        if flag
            t = a : h : b;
        end
    end
    for i = 1 : length(t)
        xx(i) = f(t(i));
    end
    error = max(abs(xx - x));
    plot(t, x, 'b');
    grid on;
    hold on;
    plot(t, xx, 'r');
end