function [a, b] = interval(x1, x2, step)
    for x = x1 : step : x2 - step
        if f(x) < 0 && f(x + step) > 0 || f(x) > 0 && f(x + step) < 0
            a = x;
            b = x + step;
            return;
        elseif f(x) == 0
            a = x;
            b = x;
            return;
        end
    end
end