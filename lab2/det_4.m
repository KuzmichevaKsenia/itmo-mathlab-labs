% вычисл€ет определитель методом √аусса
function [det, number] = det_4(A)
    n = size(A, 1);
    if n == size(A, 2)
        number = 0;
        for i = n : -1 : 2
            [A, num, zeroCol] = zeroRowFromTo(A, i, 1, i - 1);
            if zeroCol
                det = 0;
                return;
            end
            number = number + num;
        end
        det = 1;
        for i = 1 : n
            det = det * A(i, i);
            number = number + 1;
        end
    else error('ќпределитель можно вычислить только дл€ квадратной матрицы!');
    end
end

