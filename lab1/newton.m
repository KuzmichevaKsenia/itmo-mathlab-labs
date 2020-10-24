function [] = newton(xc, yc)
    plot(xc,yc,'o');
    hold on;
    x = 0 : 0.1 : 10;
    n = length(xc);
    for  k = 1 : n - 1
        for i = 1: n - k
            yc(i) = (yc(i+1) - yc(i)) / (xc(i+k) - xc(i));
        end
    end
    y = yc(1);
    for k = 2 : n
        y = yc(k) + (x - xc(k)) .* y;
    end
    plot(x,y);
end