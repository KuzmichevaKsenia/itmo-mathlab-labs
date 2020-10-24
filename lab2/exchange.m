% осуществляет перестановку строк матрицы C чтобы избавиться от нулей на
% главной диагонали
function [C, zeroCol] = exchange(C, i)
    k = 1;
    if i ~= size(C, 1)
        k = k + 1;
    end
    zeroCol = false;
    while C(k, i) == 0
        k = k + 1;
        if k > size(C, 1)
            if ~zeroCol
                k = 1;
            else return;
            end
            zeroCol = true;
        end
    end
    for j = 1 : size(C, 2)
        s = C(i, j);
        C(i, j) = C(k, j);
        C(k, j) = s;
    end
end