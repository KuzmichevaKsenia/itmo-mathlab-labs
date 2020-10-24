% решает систему линейных уравнений Ax = b матричным методом
function [x, number] = solvM(A, b)
    [I, num] = invA(A);
    number = num;
    [x, num] = prodAB(I, b);
    number = number + num;
end