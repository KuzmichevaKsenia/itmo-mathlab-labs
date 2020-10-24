function [s, h, delta, k] = trap(a, b, eps)
    n = 2;
    h = (b - a) / n;
    k = 2;
    insum = 0;
    for x = a + h : h : b - h
        insum = insum + f(x);
        k = k + 1;
    end
    s = h * ((f(a) + f(b)) / 2 + insum);
    s1 = abs(s) + eps;
    k = k + 5;
    while abs(s - s1) > eps
        n = 2 * n;
        h = (b - a) / n;
        insum = 0;
        k = k + 3;
        for x = a + h : h : b - h
            insum = insum + f(x);
            k = k + 1;
        end
        s1 = s;
        s = h * ((f(a) + f(b)) / 2 + insum);
        k = k + 5;
    end
    M = max(df2(a), df2(b));
    delta = h^2 * (b - a) * M / 12;
end