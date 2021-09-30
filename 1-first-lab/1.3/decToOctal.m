function y = decToOctal(n)
 
    % array to store
    % octal number
    octalNum = [];
 
    % counter for octal
    % number array
    i = 0;
    while (n ~= 0)
 
        % storing remainder
        % in octal array
        octalNum(i) = mod(n,8);
        n = floor(n/8);
        i = i + 1;
    end
    
    % printing octal number
    % array in reverse order
    for j = i-1:-1:0
        y = ctalNum(j)
    end
end