function y = hornermod(a,x,x0)

    syms b;
    n = length(a);
    y = a(1) + a(2) * (b - x(1));
    for j = 3:n
        y = y + a(j) * (b - x(1)) * (b - x(j-1));
    end
    
    b = x0;
    y = subs(y);
end