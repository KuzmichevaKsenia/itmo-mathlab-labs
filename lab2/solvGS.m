% ������ ������� �������� ��������� Ax = b ������� ������� ������-�������
% � ��������� eps = 0.001
function [x, number] = solvGS(A, b)
    number = 0;
    n = size(A, 1);
    if ~isDiagonallyDominant(A)
        error('������� �� ����� ������������� ������������!');
    end
    if n ~= size(b, 1)
        error('�� ����� ������ �������!');
    end
    eps = 0.001;
    e = zeros(1, n); % �������� ����� x'��� ��������
    x = zeros(n, 1);
    for k = 1 : 100 % ����������� �� ���������� ��������
        newX = zeros(n, 1);
        for i = 1 : n
            sum = 0;
            for j = 1 : n
                if i ~= j
                    sum = sum + A(i, j) * x(j, 1);
                    number = number + 2;
                end
            end
            newX(i, 1) = (b(i, 1) - sum) / A(i, i);
            e(i) = abs(x(i, 1) - newX(i, 1));
            number = number + 4;
            x(i, 1) = newX(i, 1);
        end
        x = newX;
        if max(e) < eps
            return;
        end
    end
    error('����� 100 ��������!');    
end