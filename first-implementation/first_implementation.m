% ===========================================================
%       NUMERICAL ALGORITHMS - FIRST IMPLEMENTATION
%               SIMAO JOSE VARELA MORENO
% ===========================================================
clear;clc

N = 8;                  % where N+1 is the number on grid nodes,
x = (a:0.1:b);          % the grid nodes built as xj = a + j h, h = (b ? a)/N, j = 0, . . . , N,
a = -5; 
b = 5; 
h = (b-a)/N; 
n = 10000; 
k = 10^(-3);
s = (-5:0.0001:5);      % points at which we evaluate, sj = a + n h, . . . k = 10^(?3) , n = 0, . . . , 1000,

yx = @(x) sin(x);               
fx = @(x) 1./(1+x^2);           % runge function. we can use instead of this the runge function that i created y=fr(x)

% Calculate the nodes of the interpolation using Lagrange polynomials
for j = 1:N+1 								% N+1 is the number of grid nodes !!!!!
    nodes(j) = a+(j-1)*h;
    yj(j) =  fx(nodes(j)); % yx(j)  such that, yj = f(xj), j = 0, . . . , N.
end

% Calculate the Lagrange polynomial evaluating
% the coefficients through differences divided:
for i = 1:N+1
    for j = N+1:-1:i+1
	yj(j) = (yj(j)-yj(j-1))/(nodes(j)-nodes(j-i)); 			% Calculation of divided differences
    end
end

% Construct the Lagrange interpolating polynomial
% We evaluate the interpolant in s to better calculate the error 
y_horner = yj(N+1);
for i = N:-1:1
	y_horner = yj(i)+((s-nodes(i)).*y_horner); 			% interpolation with equally spaced nodes 
end

w = 1./(1+s.^2); 							% calculate the function with nodes sj

e_lag = lagrange(N,s,y_horner,s,w)	

aux = 0;
for i = 0:N-1
   x1 = a+i*(b-a)/N; 							% value x(i-1)
   x2 = a+(i+1)*(b-a)/N; 						% value x(i)
   x = [x1 x2];
   a_pieces =  (x1:0.0001:x2); 						% Define the interval 
   w_pieces = 1./(1+a_pieces.^2); 					% Calculate the interval 
   fx2 = (1/(1+(x2)^2)-(1/(1+(x1)^2)))/(x2 - x1); 			% differences divided 
   p_pieces = (1/(1+(x1)^2)-(x1)* fx2) + a_pieces * fx2; 		% Mount the polynomial of degree 1 
   e_lintr = intlintr(N,x,p_pieces,a_pieces,w_pieces); 			% Calculate the error 
   if(e_lintr > aux)
       aux = e_lintr; 							% Take the maximum error 
   end
end
e_lintr = aux


% ===========================================================
%       NUMERICAL ALGORITHMS - FIRST IMPLEMENTATION
%               SIMAO JOSE VARELA MORENO
% ===========================================================