function [x, t, h, error, k] = xeuler(x0, a, b, eps)
    k = 0;
    n_prev = 2;
    flag = false;
    while ~flag
        flag = true;
        n_prev = n_prev * 2;
        k = k + 1;
        h_prev = (b - a) / n_prev;
        k = k + 2;
        x_prev(1) = x0;
        n_next = n_prev * 2;        
        k = k + 1;
        h_next = (b - a) / n_next;
        k = k + 2;
        x_next(1) = x0;
        j = 1;
        for i = 1 : n_prev
            x_prev(i + 1) = x_prev(i) + h_prev*dx(x_prev(i), a + (i - 1)*h_prev);
            x_next(j + 1) = x_next(j) + h_next*dx(x_next(j), a + (j - 1)*h_next);
            j = j + 1;
            x_next(j + 1) = x_next(j) + h_next*dx(x_next(j), a + (j - 1)*h_next);
            r = abs(x_next(j + 1) - x_prev(i + 1));
            k = k + 16;
            if r >= eps
                flag = false;
                break;
            end
            j = j + 1;
        end
        if flag
            x = x_next;
            t = a : h_next : b;
            h = h_next;
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