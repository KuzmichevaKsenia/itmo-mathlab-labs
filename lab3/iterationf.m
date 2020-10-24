function [x, i] = iterationf(x1, x2, step, eps)
    [a, b] = interval(x1, x2, step);
    i = 0;
    q = max(abs(dg(a)), abs(dg(b)));
    disp(q);
    d = eps * (1 - q) / q;
    x0 = (a + b) / 2;
    x = g(x0);
    while abs(x - x0) > d
        x0 = x;
        x = g(x0);
        i = i + 1;
        if i == 100
            break;
        end
    end    
end