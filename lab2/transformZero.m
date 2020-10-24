% складывает со строкой row все остальные, чтобы избавиться от нуля A(row, col)
% zeroCol - булевая переменная, возращающая true, если весь столбец col нулевой.
function [A, number, zeroCol] = transformZero(A, row, col)
    [m, n] = size(A);
    zeroCol = false;
    number = 0;
    if A(row, col) == 0
        for i = 1 : m
            if i == row
                continue;
            end
            for j = 1 : n
                A(row, j) = A(row, j) + A(i, j);
                number = number + 1;
            end
        end
    else return;
    end
    % Если после преобразований элемент A(row, col) остался нулевым,
    % это значит, что весь столбец col нулевой.
    if A(row, col) == 0
        zeroCol = true;
    end
end

