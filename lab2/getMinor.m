% возвращает матрицу M, равную матрице A без row-той строки и col-того столбца
function [M] = getMinor(A, row, col)
    [m, n] = size(A);
    M = zeros(m - 1, n - 1);
    escapeRow = 0;
    for i = 1 : m
        escapeCol = 0;
        if i == row
            escapeRow = 1;
            continue;
        end
        for j = 1 : n
            if j == col
                escapeCol = 1;
                continue;
            end
            M(i - escapeRow, j - escapeCol) = A(i, j);
        end        
    end
end