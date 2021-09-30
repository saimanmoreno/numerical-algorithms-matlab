B =[-4     8     1    -7;
   -10    15     2   -10;
    11   -16     0    15;
    -5     8     1    -6]
disp('Aplication of the power method to  A')
N=400;
tol=1.0e-6;
x0a=[1,1,1,1]';
disp(['tol = ',num2str(tol),', initial iteratuib x0a'])
[niter, lambda, v] = powmet(B, x0a, tol, N);
[niter lambda]



[niter,lambda,x0]=invpow(B,x0a,tol,N,-4)
