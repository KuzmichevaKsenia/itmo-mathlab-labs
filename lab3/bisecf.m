function [x, i] = bisecf(x1, x2, step, eps)
    [a, b] = interval(x1, x2, step);
    x0 = a : step / 8 : b;
    x0 = x0';
    y0 = zeros(size(x0, 1), 1);
    for j = 1 : size(x0, 1)
        y0(j) = f(x0(j));
    end
    plot(x0, y0);
    grid on;
    hold on;
    i = 0;
    while abs(a - b) > 2 * eps
        x = (a + b) / 2;
        if f(a) * f(x) < 0
            b = x;
        elseif f(x) * f(b) < 0
            a = x;
        end        
        plot([a b], [f(x) f(x)], 'k');
        i = i + 1;
        text(b, f(x), num2str(i));        
        plot(x, f(x), 'b*');
        if i == 100
            break;
        end
    end
    x = (a + b) / 2;
    plot(x, f(x), 'r*');
end