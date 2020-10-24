function [s, h, delta, k] = simpson(a, b, eps)
    n = 2;
    h = (b - a) / n;
    k = 2;
    evensum = 0;
    oddsum = 0;
    for x = a + h : 2 * h : b - h
        oddsum = oddsum + f(x);
        k = k + 1;
    end
    for x = a + 2 * h : 2 * h : b - 2 * h
        evensum = evensum + f(x);
        k = k + 1;
    end
    s = h * (f(a) + 4 * oddsum + 2 * evensum + f(b)) / 3;
    s1 = abs(s) + eps;
    k = k + 8;
    while abs(s - s1) > eps
        n = 2 * n;
        h = (b - a) / n;
        evensum = 0;
        oddsum = 0;
        k = k + 3;
        for x = a + h : 2 * h : b - h
            oddsum = oddsum + f(x);
            k = k + 1;
        end
        for x = a + 2 * h : 2 * h : b - 2 * h
            evensum = evensum + f(x);
            k = k + 1;
        end
        s1 = s;
        s = h * (f(a) + 4 * oddsum + 2 * evensum + f(b)) / 3;
        k = k + 8;
    end
    M = max(df4(a), df4(b));
    delta = h^4 * (b - a) * M / 180;
end