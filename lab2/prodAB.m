function [C, number] =  prodAB(A, B)
    [m, n] = size(A);
    k = size(B, 2);
    number = 0;
    C = zeros(m, k);
    if n == size(B, 1)
        for i = 1 : m
            for j = 1 : k
                sum = 0;
                for t = 1 : n
                    sum = sum + A(i, t) * B(t, j);
                    number = number + 2;
                end
                C(i, j) = sum;
           end
        end
    else error('Две матрицы можно перемножить только если количество столбцов первой матрицы равно количеству строк второй матрицы!');
    end
end