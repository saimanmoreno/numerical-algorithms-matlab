function y = derive2(f,a,b,n)
    % k = (0:n);
    h = (b-a)/n;
    x = a:h:b;                              % a + k * h;
     
    y = (f(x+h)-2*f(x)+f(x-h))/(h^2);       % central difference
end

