function y = intTrap(a,b,n)
    % k = (0:n);
    h = (b-a)/n;
    x = a:h:b;                              % a + k * h;
    
    fx = sin(x);
    
    y = h*((fx(1)+fx(end)) / 2+sum(fx(2:end-1)));
end

