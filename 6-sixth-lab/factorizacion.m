function [Q,R] = factorizacion(A)
    % gives back the Q R factorization of a square and 
    % regular matrix A with size n × n, by means of the
    % Gram-Schmidt method, with the following input parameter
    %   • A, matrix to factorize,
    % and output parameters
    %   • Q, gives the orthogonal matrix Q,
    %   • R, gives the upper triangular matrix R
    % by SIMAO JOSE VARELA MORENO
    
    n = length(A);
    
    for k=1:n
        Q(:,k)=A(:,k);
        R(1:k-1,k)=transpose(Q(:,1:k-1))*Q(:,k);
        Q(:,k)=Q(:,k)-Q(:,1:k-1)*R(1:k-1,k);
        R(k,k)=norm(Q(:,k));
        Q(:,k)=Q(:,k)/R(k,k);
    end
end

