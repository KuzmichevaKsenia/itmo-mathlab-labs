% обрезает нулевые столбцы и строки матрицы
function [A] = cutZeros(A)
    [m, n] = size(A);
    % проверяем строки
    sum = 0;
    for i = 1 : m
        for j = 1 : n
            sum = sum + A(i, j);
        end
        if sum == 0
            if m == 1
                A = [];
                return;
            elseif i == 1
                A = A(2 : m, 1 : n);
                A = cutZeros(A);
                return;
            elseif i == m
                A = A(1 : m - 1, 1 : n);
                A = cutZeros(A);
                return;
            else A = cat(1, A(1 : i - 1, 1 : n), A(i + 1 : m, 1 : n));
                A = cutZeros(A);
                return;
            end
        end
        sum = 0;
    end
    % проверяем столбцы
    sum = 0;
    for j = 1 : n
        for i = 1 : m
            sum = sum + A(i, j);
        end
        if sum == 0
            if n == 1
                A = [];
                return;
            elseif j == 1
                A = A(1 : m, 2 : n);
                A = cutZeros(A);
                return;
            elseif j == n
                A = A(1 : m, 1 : n - 1);
                A = cutZeros(A);
                return;
            else A = cat(2, A(1 : m, 1 : j - 1), A(1 : m, j + 1 : n));
                A = cutZeros(A);
                return;
            end
        end
        sum = 0;
    end
end