% ��������� ������������ ������� LU-����������
function [det, number] = det_3(A)
    n = size(A, 1);
    if n == size(A, 2)
        [~, U, number, zeroCol] = LU(A);
        if zeroCol
            det = 0; % ���� ���� ������� �������, ������������ ������ ����.
            return;
        end
        det = 1;
        for i = 1 : n
            det = det * U(i, i);
            number = number + 1;
        end
    else error('������������ ����� ��������� ������ ��� ���������� �������!');
    end
end