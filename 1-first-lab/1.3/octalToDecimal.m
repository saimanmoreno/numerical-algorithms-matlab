function y = octalToDecimal(n)

    num = n;
	y = 0;

	%# Initializing base value
	% to 1, i.e 8^0
	base = 1;

	temp = num;
	while (temp)

		% Extracting last digit
		last_digit = mod(temp,10);
		temp = floor(temp/10);

		%# Multiplying last digit
		%# with appropriate base
		%# value and adding it
		%# to dec_value
		y = y + last_digit * base;

		base = base * 8;
    end
end
