function e = lagrange(N,x,y,s,w)
    %{ 
        Develop a Matlab function: function e=lagrange(N,x,y,s,w) 
        with the following input parameters:
            N, where N+1 is the number on grid nodes,
            x, the grid nodes built as
                xj = a + j h, h = (b-a)/N, j = 0, . . . , N,
            y, such that, yj = f(xj), j = 0, . . . , N.
            s, points at which we evaluate,
                sj = a + n h, . . . k = 10?3 , n = 0, . . . , 1000,
            w, wj = f(sj), , j = 0, . . . , 1000.
    
        output parameters
            e, error at evaluate values, 
    %}
    
    temp = 0;
    for i = 1:length(s)
        if(abs(w(i)-y(i))> temp)
           temp = abs(w(i)-y(i));
        end
    end
    e = temp;
    
end
