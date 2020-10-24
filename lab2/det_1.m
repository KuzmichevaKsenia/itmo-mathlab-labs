% вычисляет определитель прямым методом
function [det, number] = det_1(A)
    n = size(A, 1);
    if n == size(A, 2)
        [det, number] = calcDet_1(A, n);
    else error('Определитель можно вычислить только для квадратной матрицы!');
    end
end

function [det, number] = calcDet_1(A, n)
    det = 0;
    number = 0;
    if n == 1
        det = A(1, 1);
    else for i = 1 : n
            a = A(1, i);
            M = getMinor(A, 1, i);
            [d, num] = calcDet_1(M, n - 1);
            number = number + num;
            det = det + a * (-1).^(1 + i) * d;
            number = number + 5;
        end
    end
end