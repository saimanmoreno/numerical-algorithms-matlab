function y = hornerd(a,x0)
    a = fliplr(a);
    n = length(a);
    y = a(1);
    for j = 2:n
        y = y*x0 + a(j);
    end
end

%syms x
%p = x^3 - 6*x^2 + 11*x - 6;
%y = horner(p)