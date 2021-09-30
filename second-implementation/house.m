function [u,norma]=house(x)
    % %datos de entrada
    %x vector del que se quiere calcular los reflectores de householder
    % %datos de salida
    %u vector con con los reflectores de householder segun las condiciones del enunciado
    %norma es el valor numerico con la norma del vector x
    u=x;
    norma=norm(x);
    u(1)=sign(x(1))*(abs(u(1))+norma);
end