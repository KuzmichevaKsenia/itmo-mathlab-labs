function [x, i] = combf(x1, x2, step, eps)
    [a, b] = interval(x1, x2, step);
    x0 = a : step / 2028 : b;
    x0 = x0';
    y0 = zeros(size(x0, 1), 1);
    for j = 1 : size(x0, 1)
        y0(j) = f(x0(j));
    end
    plot(x0, y0);
    grid on;
    hold on;
    i = 0;
    while abs(a - b) > 2 * eps
        if f(a) * df2(a) < 0
            a = a - f(a) * (a - b) / (f(a) - f(b));            
            plot([a b], [f(a) f(b)], 'k');        
            text(a, f(a), num2str(i + 1)); 
        elseif f(a) * df2(a) > 0
            a = a - f(a) / df(a);
            plot([a a-f(a)/df(a)], [f(a) 0], 'k');
            text(a, f(a), num2str(i + 1));
        end
        if f(b) * df2(b) < 0
            b = b - f(b) * (b - a) / (f(b) - f(a));          
            plot([b a], [f(b) f(a)], 'k');       
            text(b, f(b), num2str(i + 1)); 
        elseif f(b) * df2(b) > 0
            b = b - f(b) / df(b);
            plot([b b-f(b)/df(b)], [f(b) 0], 'k');
            text(b, f(b), num2str(i + 1));
        end               
        plot((a + b) / 2, f((a + b) / 2), 'b*');
        i = i + 1;
        if i == 100
            break;
        end
    end
    x = (a + b) / 2;    
    plot(x, f(x), 'r*');
end