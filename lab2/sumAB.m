function [C, number] = sumAB(A, B)
    [m, n] = size(A);
    number = 0;
    C = zeros(m, n);
    if m == size(B, 1) && n == size(B, 2)
        for i = 1 : m
            for j = 1 : n
               C(i, j) = A(i, j) + B(i, j);
               number = number + 1;
           end
        end
    else error('—кладывать можно только матрицы одного размера!');
    end
end

