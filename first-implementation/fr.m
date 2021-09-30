function y = fr(x)
    %{
        Develop a Matlab function: function y=fr(x) which gives back 
        the evaluation of Runge function of vector x on vector y.
        runge function: @(x) 1 ./ (1 + 25.*x.^2)
    %}
    
    y = @(x) 1./(1+x.^2);
   
end

