% решает систему линейных уравнений Ax = b методом простых итераций
% с точностью eps = 0.001
function [x, number] = solvFPI(A, b)
    number = 0;
    n = size(A, 1);
    if ~isDiagonallyDominant(A)
        error('Матрица не имеет диагонального преобладания!');
    end
    if n ~= size(b, 1)
        error('Не верно заданы матрицы!');
    end
    eps = 0.001;
    e = zeros(1, n); % разности между x'ами итераций
    x = zeros(n, 1);
    for k = 1 : 100 % ограничение на количество итераций
        newX = zeros(n, 1);
        for i = 1 : n
            sum = 0;
            for j = 1 : n
                if i ~= j
                    sum = sum + A(i, j) * x(j, 1);
                    number = number + 2;
                end
            end
            newX(i, 1) = (b(i, 1) - sum) / A(i, i);
            e(i) = abs(x(i, 1) - newX(i, 1));
            number = number + 4;
        end
        x = newX;
        if max(e) < eps
            return;
        end
    end
    error('Более 100 итераций!');        
end