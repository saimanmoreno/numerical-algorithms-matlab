A =[-4     8     1    -7;
   -10    15     2   -10;
    11   -16     0    15;
    -5     8     1    -6];

n = 10;
h = 1/(n+1);
d1 = diag(ones(n,1));
d2 = diag(ones(n-1,1),1);
d3 = diag(ones(n-1,1),-1);
D = 1/(h^2)*(2*d1+d2+d3);

disp('Aplication of the power method to  A')
N=400;
tol=1.0e-6;
x0a=[1,1,1,1]';
disp(['tol = ',num2str(tol),', initial iteratuib x0a'])
[niter, lambda, v] = powmet(A, x0a, tol, N);
[niter lambda]


disp('Aplication of the inverse power method to  A')
[niter,lambda,x0] = invpow(A,x0a,tol,N,-4);
[niter lambda]