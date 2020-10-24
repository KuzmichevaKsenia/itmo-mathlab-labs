% решает систему линейных уравнений Ax = b методом Гауса
function [x, number] = solvG(A, b)
    number = 0;
    [d, num] = det_2(A);
    number = number + num;
    if d ~= 0
        n = size(A, 1);
        if n == size(b, 1) && size(b, 2) == 1
            % функция Simplex(A, b) возвращает расширенную матрицу системы,
            % приведенную к диагональному виду
            [C, num] = simplex(A, b);
            number = number + num;
            x(n) = C(n, n + 1);
            for j = 1 : n - 1
                s = 0;
                for k = 0 : j - 1
                    s = s + C(n - j, n - k) * x(n - k);
                    number = number + 2;
                end
                x(n - j) = (C(n - j, n + 1) - s) / C(n - j, n - j);
                number = number + 2;
            end
            x = transA(x);
            else error('некорректная матрица b!');
        end
    else error('Матрица A должна быть невырожденной!');
    end
end