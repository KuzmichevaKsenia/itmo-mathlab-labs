% ���������� �� ������� row ��� ���������, ����� ���������� �� ���� A(row, col)
% zeroCol - ������� ����������, ����������� true, ���� ���� ������� col �������.
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
    % ���� ����� �������������� ������� A(row, col) ������� �������,
    % ��� ������, ��� ���� ������� col �������.
    if A(row, col) == 0
        zeroCol = true;
    end
end

