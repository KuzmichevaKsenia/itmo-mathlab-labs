% путем элементарных преобразований обнуляет элементы строки row матрицы A
% от столбца from до столбца to включительно
function [A, number, zeroCol] = zeroRowFromTo(A, row, from, to)
    [m, n] = size(A);
    zeroCol = false;
    if row < 1 || row > m || from < 1 || from > to || from > n || to > n || from == 1 && to == n
        error('Неверные границы для обнуления элементов строки!');
    end
    number = 0;
    % выбираем опорный ненулевой элемент col
    col = 0;
    % если опорный элемент не найден, берем нулевой элемент zeroElement и
    % преобразуем матрицу так, чтобы он стал ненулевым, после чего берем
    % его за опорный
    zeroElement = 0;
    for j = 1 : n
        if j < from || j > to
            if A(row, j) == 0
                zeroElement = j;
            else
                col = j;
                break;
            end
        end
    end
    if col == 0
        col = zeroElement;
        [A, num, zeroCol] = transformZero(A, row, col);
        number = number + num;
        if zeroCol
            return;
        end
    end
    
    for j = from : to
        k = - A(row, j) / A(row, col);
        number = number + 1;
        for i = 1 : m
            if i == row
                A(i, j) = 0;
            else
                A(i, j) = A(i, j) + k * A(i, col);
                number = number + 2;
            end;
        end
    end
end

