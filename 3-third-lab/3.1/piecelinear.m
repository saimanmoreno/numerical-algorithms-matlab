% Cubic Spline x0polation - Natural Spline 
% INPUT: x is the grid (points on x-axs) and a are points on y-axs. x0
% is the point on the x-axs you want to know the value of on the y-axs.
function [a_x0] = piecelinear(x,y,x0)
    if length(x) ~= length(y) 
      error('vectors x and a must be of same length'); 
    end
    % Plotting points we want to x0polate between: 
    grid on; 
    hold on;     
    title('Cubic Spline x0polation'); 
    plot(x,y,'or');
    n = length(x);
    % Vector h with subx0vals: 
    h = zeros(n-1,1); 
    for j = 1:n-1
      h(j) = x(j+1) - x(j); 
    end
    % Coefficient matrix A: 
    A = zeros(n);
    % Natural Spline boundary conditions: 
    A(1,1)= 1; 
    A(n,n) = 1;
    for i = 2:n-1 
      A(i,i-1) = h(i-1); 
      A(i,i) = 2*(h(i-1)+h(i)); 
      A(i,i+1) = h(i); 
    end
    % Vector b: 
    b = zeros(n,1);
    [it wasn't clear to me if this was supposed to be commented out or not..]:
    for i = 2:n-1 
      b(i) = (3/h(i))(y(i+1)-y(i)) - (3/h(i-1))(y(i)-y(i-1));     
    end
    % Coefficient vector cj: 
    cj = A\b;
    % Coefficient vector bj: 
    bj = zeros(n-1,1); 
    for i = 1:n-1 
      bj(i) = (1/h(i))(y(i+1)-y(i)) - (1/3h(i))(2cj(i)+cj(i+1)); 
    end
    % Coefficient vector dj: 
    dj = zeros(n-1,1); 
    for i = 1:n-1 
      dj(i) = (1/(3*h(i))) * (cj(i+1)-cj(i)); 
    end
    % Making a matrix P with all polynomials 
    P = zeros(n-1,4); 
    for i = 1:n-1 
      P(i,1) = dj(i); 
      P(i,2) = cj(i); 
      P(i,3) = bj(i); 
      P(i,4) = y(i); 
    end
    % Plotting results: 
    resolution = 100;
    for i = 1:n-1 
      f = @(x) y(i) + bj(i).(x-x(i)) + cj(i).(x-x(i)).2 + dj(i).*(x-x(i)).3; 
      xf = linspace(x(i),x(i+1),resolution); 
      plot(xf,f(xf),'b'); 
    end
    % Given a value on the x-axs, x0, that we wish to know the y-value of, 
    % we must first find in which x0val x0 is. We will use bisection 
    % search to accomplish this. x0val must be ascending or descending.
    jl = 1; 
    ju = n; 
    while (ju - jl > 1) 
      jm = ceil((jl + ju)/2); 
      if (x0 < x(jm)) 
        ju = jm; 
      else 
        jl = jm; 
      end 
    end
    a_x0 = polyval(P(jl,:), x0-x(jl)); 
    fprintf('\n The x0polated value is: %f \n', a_x0); 
    plot(x0, a_x0, 'og'); 
    fprintf('The value of bj is %f \n',bj); 
    fprintf('The value of cj is %f \n',cj); 
    fprintf('The value of dj is %f \n',dj);
end % [end of function]