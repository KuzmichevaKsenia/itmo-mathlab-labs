% вычисляет обратную матрицу
function [B, number] = invA(A)
    number = 0;
    n = size(A, 1);
    if n == size(A, 2)
        B = zeros(n);
        [det, num] = det_1(A);
        number = number + num;
        if det ~= 0
            for i = 1 : n
                for j = 1 : n
                    [minorDet, num] = det_1(getMinor(A, i, j));
                    B(i, j) = (-1) .^ (i + j) * minorDet / det;
                    number = number + num + 4;
                end
            end
            B = transA(B);
        else error('Если определитель матрицы равен нулю, обратной матрицы не существует!');
        end
    else error('Понятие обратной матрицы существует только для квадратных матриц!');
    end
end