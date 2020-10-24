function [] = lagrange(xc, yc)
    plot(xc,yc,'o');
    hold on;
    x = 0 : 0.1 : 10;
    y = 0;
    n = length(xc);
    for k = 1 : n
        p = 1;
        for l = 1 : n
            if ( k ~= l)
                p = p .* (x - xc(l)) / (xc(k) - xc(l));
            end
        end
        y = y + yc(k) * p;
    end
    plot(x, y)
end