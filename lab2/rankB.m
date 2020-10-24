function [rank, number] = rankB(B)
    number = 0;
    [m, n] = size(B);
    B = cutZeros(B); % если матрица нулевая ее ранг равен 0
    if isempty(B)
        rank = 0;
        return;
    end
    rank = 1;
    if m == 1 || n == 1 % ранг вектора-строки(-столбца) равен 1
        return;
    end
   for degree = 2 : min(m, n) % порядок минора
       sumdet = 0; % сумма определителей миноров одного порядка
       rows = nchoosek(1 : m, degree); % комбинации номеров строк
       cols = nchoosek(1 : n, degree); % комбинации номеров столбцов
       for row = 1 : size(rows, 1)
           for col = 1 : size(cols, 1)
               A = zeros(degree, degree);
               for i = 1 : degree
                   for j = 1 : degree
                       A(i, j) = B(rows(row, i), cols(col, j));
                   end
               end
               [det, num] = det_2(A);
               sumdet = sumdet + det;
               number = number + num + 1;
           end
       end
       % если определители всех миноров одного порядка равны нулю, то
       % ранг равен порядку последних рассматриваемых миноров.
       if sumdet == 0
           return;
       end
       rank = rank + 1;
   end
end