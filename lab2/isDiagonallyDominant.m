function [res] = isDiagonallyDominant(A)
    res = true;
    n = size(A, 1);
    if n == size(A, 2) % матрица должна быть квадратной
        checkStrict = false; % хотя бы в одной строке на главной диагонали
                             % должен быть элемент строго больший суммы
                             % модулей всех остальных элементов этой строки
        for i = 1 : n
            sum = 0;
            for j = 1 : n
                if i == j
                    continue;
                end
                sum = sum + abs(A(i, j));
            end
            if abs(A(i, i)) < sum
                res = false;
                return;
            end
            if abs(A(i, i)) > sum
                checkStrict = true;
            end
        end
        if ~checkStrict
            res = false;
            return;
        end
    else res = false;
    end
end

