% ����� ������������ �������������� �������� �������� ������ row ������� A
% �� ������� from �� ������� to ������������
function [A, number, zeroCol] = zeroRowFromTo(A, row, from, to)
    [m, n] = size(A);
    zeroCol = false;
    if row < 1 || row > m || from < 1 || from > to || from > n || to > n || from == 1 && to == n
        error('�������� ������� ��� ��������� ��������� ������!');
    end
    number = 0;
    % �������� ������� ��������� ������� col
    col = 0;
    % ���� ������� ������� �� ������, ����� ������� ������� zeroElement �
    % ����������� ������� ���, ����� �� ���� ���������, ����� ���� �����
    % ��� �� �������
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

