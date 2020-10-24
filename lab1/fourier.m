function dev = fourier (xc, yc)
    plot(xc,yc,'o');
    hold on;
    x = 0 : 0.1 : 10;
    m = length(xc);
    T = 11;
    n = 5;
    A = zeros(1, 6);
    B = zeros(1, 6);
    summAi = 0;
    summBi = 0;
    summ = 0;
    for i = 0 : 5
        for k = 0 : m - 1
            summAi = summAi + yc(k + 1) * cos(i * 2 * pi * k / m);
            summBi = summBi + yc(k + 1) * sin(i * 2 * pi * k / m);
        end
        A(i + 1) = (2 / m) * summAi;
        B(i + 1) = (2 / m) * summBi;
        summAi = 0;
        summBi = 0;
    end
    for i = 1 : n
        summ = summ + A(i + 1) * cos(i * 2 * pi * x / T) + B(i + 1) * sin(i * 2* pi * x / T);
    end
    y = A(1) / 2 + summ;
    plot(x, y);
    dev = 0;
    for k = 1 : 11
        dev = dev + (y(k) - yc(k)) ^ 2;
    end
end