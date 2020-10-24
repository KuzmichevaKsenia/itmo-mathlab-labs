function [res] = isDiagonallyDominant(A)
    res = true;
    n = size(A, 1);
    if n == size(A, 2) % ������� ������ ���� ����������
        checkStrict = false; % ���� �� � ����� ������ �� ������� ���������
                             % ������ ���� ������� ������ ������� �����
                             % ������� ���� ��������� ��������� ���� ������
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

