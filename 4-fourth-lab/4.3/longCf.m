function y = longCf(f,a,b,n)
    
    syms x;
    f1 = diff(f, x);
    l = @(x)sqrt(1+f1.^2);
    
    y = ((f(a)+f(b))/2)*(b-a);      % trapezoidal rule

end

