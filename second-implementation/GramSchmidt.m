function [Q,R] = GramSchmidt(A)
    [n,n] =  size(A);
    Q = eye(n);
    for i = 1:n
        for j = 1:i-1
            R(j,i) = Q(:,j)'*A(:,i);
            Q(:,i) = A(:,i) - Q(:,j)*R(j,i);
        end
        R(i,i) = sqrt(Q(:,i)'*Q(:,i));
        Q(:,i)=Q(:,i)/R(i,i);
    end
end