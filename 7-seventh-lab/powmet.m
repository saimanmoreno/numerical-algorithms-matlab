function [niter, lambda, x0] = powmet(A, x0, tol, N)
% Input
% A matrix
% x0 initial iteration
% tol tolerance
% N maximum number of iterations

% Output
% niter number of iterations 
% lambda apprach to the dominant eigenvalue 
% x0 eigenvector related with to the dominant eigenvalue 

% histl other values of lambda
% error store the differences between two approximations
% xnew auxiliar variable
% vmax, imax, value and component of the absolute maximum component

error=2*tol;
[vmax,imax]=max(abs(x0));
histl(1)=x0(imax);
x0=x0/histl(1);
niter=1;
while (error > tol) & (niter<N)
    niter=niter+1;
    xnew=A*x0;
    [vmax,imax]=max(abs(xnew));
    histl(niter)=xnew(imax);
    xnew=xnew/histl(niter);
    error=max(abs(histl(niter)-histl(niter-1)));
    x0=xnew;
end
if niter==N
    disp('We reach the maximum number of iterations')
end
lambda=histl(niter);