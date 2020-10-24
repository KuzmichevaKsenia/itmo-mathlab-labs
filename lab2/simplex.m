% ���������� ����������� ������� ������� A * x = b, ����������� �
% ������������� ����
function [C, number] = simplex(A, b)
    number = 0;
    n = size(A, 1); % ����������� ����� ��������� �������
    C = cat(2, A, b); % �������� ����������� ������� �������
    for i = 1 : n - 1
        if C(i, i) == 0
            % ������� Exchange(C, i) ������������ ������������ ����� ���
            % ����������� � ������� ������ �������� �������� �� �������
            % ���������
            C = exchange(C, i);
        end
        for j = 0 : n
            C(i, n + 1 - j) = C(i, n + 1 - j) / C(i, i);
        end
        for m = i + 1 : n
            k = C(m, i);
            for j = i : n + 1
                C(m, j) = C(m, j) - k * C(i, j);
            end
        end
    end
    C(n, n + 1) = C(n, n + 1) / C(n, n);
    number = number + 1;
    C(n, n) = 1;
end