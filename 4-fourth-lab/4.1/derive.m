function y = derive(f,a,b,n)
    % k = (0:n);
    h = (b-a)/n;
    x = a:h:b;                                      % a + k * h;
     
    y = (f(x+h)-f(x-h))/(x*h);                      % central difference
    
    %error_central = f2(xk)-dfdx_central            % central diff error
    %dfdx_forward = (f(xk+h)-f(xk))/h;              % forward difference
    %error_forward = f2(xk)-dfdx_forward            % forward diff error
    %dfdx_backward = (f(xk)-f(xk-h))/h;             % backward difference
    %error_backward = f2(xk)-dfdx_backward          % backward diff error
end

