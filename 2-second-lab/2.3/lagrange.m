function res = lagrange(x,y,x0)
    %   Input : x = [x0 x1 ... xN], y = [y0 y1 ... yN], x0 = point to
    %   evaluate
    %   Output: res = lagrange polynomial evaluated at point x0
    
    N = length(x)-1;    %   the degree of polynomial
    l = 0;
    for m = 1:N + 1
        P = 1;
        for k = 1:N + 1
            if k ~= m, P = conv(P,[1 -x(k)])/(x(m)-x(k)); end
        end
        l=l+ y(m)*P;        %   lagrange polynomial
    end
  
    res = polyval(l,x0);
end