function [B] = transA(A)
    [m, n] = size(A);
    B = zeros(n, m); % ������� �������
    for i = 1 : m
       for j = 1 : n
           B(j, i) = A(i, j); % �������� ����������������� �������
       end
    end
end