function [B] = transA(A)
    [m, n] = size(A);
    B = zeros(n, m); % нулевая матрица
    for i = 1 : m
       for j = 1 : n
           B(j, i) = A(i, j); % Получаем транспонированную матрицу
       end
    end
end