%%      SECOND IMPLEMENTATION. LEAST SQUARES 
%%      NUMERICAL ALGORITHMS
%%      SIMAO JOSE VARELA MORENO
%%      31/05/2021
%%

% The aim of the implementation is to show the behaviour of the three 
% kinds of Q factorizations for a matrix A given theoretically.

clc; close all; clear;

j = 1;

for n = 2:15
    % we will factorize Hilbert matrix in several dimensions
    A = hilb(n);
    
    % Calculate the Hilbert condition number and update the index
    mu(j) = cond(A);
    
    % We call the factorization function (QR)
    [Q_QR,A_QR] = factorizacion(A);
    % We calculate the error norm of the Q-matrix with the unit matrix
    % In the vector, we enter the values of the norm and update the index
    vectorRef(j) =  norm(Q_QR'*Q_QR-eye(n),'fro');
    
    % We call GramSchmidt's function
    [Q_GS,A_GS] = GramSchmidt(A);
    % We calculate the error norm of the Q-matrix with the unit matrix
    % In the vector, we enter the values of the norm and update the index
    vectorGS(j) =  norm(Q_GS'*Q_GS-eye(n),'fro');
    
    % We call the GramSchmidtMod function
    [Q_Mod,A_Mod] = GramSchmidtMod(A);
    % We calculate the error norm of the Q-matrix with the unit matrix
    % In the vector, we enter the values of the norm and update the index
    vectorMod(j) =  norm(Q_Mod'*Q_Mod-eye(n),'fro');
    
    j = j+1;
end

% show the rules for each one for the different matrices
vectorRef, vectorGS, vectorMod

% We perform the representation in logarithmic form
loglog(mu,vectorRef,'-s');
hold on
loglog(mu,vectorGS,'-s');
loglog(mu,vectorMod,'-s');
grid on;
xlabel('Condition number');
ylabel('Error');
legend('Householder', 'Gram Schmidt','Gram Schmidt Modified');

% Now we will calculate the operating cost, using a vector of times 
% (calculated using the tic and toc functions).
for n = 2:9
    % We calculate the random matrix
    A = rand(2^n,2^n);
    
    % We factor
    tic;
    [Q_QR,A_QR] = factorizacion(A);
    % We calculate the time it took
    costeRef(n-1) = toc;
    
    % We factor
    tic;
    [Q_GS,A_GS] = GramSchmidt(A);
    % We calculate the time it took
    costeGS(n-1) = toc;
    
    % We factor
    tic;
    [Q_Mod,A_Mod] = GramSchmidtMod(A);
    % We calculate the time it took
    costeMod(n-1) = toc;
end

% We show in a new figure the result of the time in the form of logarithmic
costeRef,costeGS,costeMod
figure;
loglog(costeRef,'-s');
hold on
loglog(costeGS,'-s');
loglog(costeMod,'-s');
grid on;
xlabel('2^n matrix dimension');
ylabel('Processing time');
legend('Householder', 'Gram Schmidt','Gram Schmidt Modified');