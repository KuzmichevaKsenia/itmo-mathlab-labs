function [x, i] = newtonf(x1, x2, step, eps)
    [a, b] = interval(x1, x2, step);
    x0 = a : step / 128 : b;
    x0 = x0';
    y0 = zeros(size(x0, 1), 1);
    for j = 1 : size(x0, 1)
        y0(j) = f(x0(j));
    end
    plot(x0, y0);
    grid on;
    hold on;
    if f(a) * df2(a) > 0
        x = a;
    elseif f(b) * df2(b) > 0
        x = b;
    end
    plot(x, f(x), 'b*');
    i = 1;
    dx = f(x) / df(x);
    plot([x x-dx], [f(x) 0], 'k');
    text(x, f(x), num2str(i));
    while abs(dx) > eps
        x = x - dx;
        dx = f(x) / df(x);
        plot([x x-dx], [f(x) 0], 'k');
        i = i + 1;        
        text(x, f(x), num2str(i));               
        plot(x, f(x), 'b*');
        if i == 100
            break;
        end
    end
    plot(x, f(x), 'r*');
end