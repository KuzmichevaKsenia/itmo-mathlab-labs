% ������������ ������� A �� ����� ����������� ������� L � ��������� ��
% ������� ��������� � ������ ����������� ������� U.
% zeroCol ���������� true, ���� ������ ������� ������� �������
function [L, U, number, zeroCol] = LU(A)
    number = 0;
    n = size(A, 1);
    [d, num] = det_2(A);
    number = number + num;
    if d ~= 0
        zeroCol = false;
        % ������� A(1, 1) �� ������ ���� �������, ��� ��� ����� ������ �� ����
        if A(1, 1) == 0
            [A, num, zeroCol] = transformZero(A, 1, 1);
            number = number + num;
        end

        L = zeros(n);
        U = zeros(n);
        for j = 1 : n
            U(1, j) = A(1, j);
            L(j, 1) = A(j, 1) / U(1, 1);
            number = number + 1;
        end
        for i = 2 : n
            for j = i : n
                sum = 0;
                for k = 1 : i - 1
                    sum = sum + L(i, k) * U(k, j);
                    number = number + 2;
                end
                U(i, j) = A(i, j) - sum;
                number = number + 1;
                sum = 0;
                for k = 1 : i - 1
                    sum = sum + L(j, k) * U(k, i);
                    number = number + 2;
                end
                L(j, i) = (A(j, i) - sum) / U(i, i);
                number = number + 2;
            end
        end
    else error('LU-���������� ���������� ������ � ��� ������, ����� ������� ��������, � ��� ������� ������ ������� �����������!');
    end
end