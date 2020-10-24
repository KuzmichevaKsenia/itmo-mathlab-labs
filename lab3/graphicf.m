function x = graphicf(x1, x2, step)
    x0 = x1 : step : x2;
    x0 = x0';
    y0 = zeros(size(x0, 1), 1);
    for i = 1 : size(x0, 1)
        y0(i) = f(x0(i));
    end
    plot(x0, y0);
    grid on;
    hold on;
    [a, b] = interval(x1, x2, step);
    for x = a : step : b
        if round(f(x), 1) == 0
            break;
        end
    end
    plot(x, f(x), 'r*');
end