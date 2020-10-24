% ��������� ������������ ������� ��������� ������� �������
function [det, number] = det_2(A)
    n = size(A, 1);
    if n == size(A, 2)
        [det, number] = calcDet_2(A, n);
    else error('������������ ����� ��������� ������ ��� ���������� �������!');
    end
end
function [det, number] = calcDet_2(A, n)
    number = 0;
    if n == 1
        det = A(1, 1);
    % ����� ����� �� ������� ������� A(1, n)
    else [A, num, zeroCol] = zeroRowFromTo(A, 1, 1, n - 1);
        number = number + num;
        if zeroCol
            det = 0; % ���� ���� ������� �������, ������������ ������ ����.
            return;
        end
        M = getMinor(A, 1, n);
        [d, num] = calcDet_2(M, n - 1);
        number = number + num;
        det = A(1, n) * (-1) .^ (1 + n) * d;
        number = number + 4;
    end
end