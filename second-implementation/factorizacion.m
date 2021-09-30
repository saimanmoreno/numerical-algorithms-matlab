function [Q,A]=factorizacion(A)
    % %datos de entrada
    %   A matriz de dimensiones nxn de la que se quiere calcular la factorizacion
    % %datos de salida
    %   R matriz triangular superior
    %   A matriz modificada con los valores de Q
    % Otras variables
    %   n tamano de la matriz
    % % j,i contadores auxiliares
    [n,n]=size(A);
    Q=eye(n);
    for i=1:n-1
        v=A(i:n,i);
        [u,norma]=house(v);
        sig=sign(A(i,i));
        A(i,i)=-sig*norma;
        u=u/u(1);
        A(i+1:n,i)=u(2:end);
        aux=u'*u;
        for j=i+1:n
            A(i:n,j)=A(i:n,j)-2*(u'*A(i:n,j))*u/aux;
        end
        for j=1:n
            Q(i:n,j)=Q(i:n,j)-2*(u'*Q(i:n,j))*u/aux;
        end
    end
    Q=Q';
end