def binarypi(a, x):
    
    whole, dec = str(a).split(".")
    
    whole = int(whole)
    dec = int(dec)
    out = bin(whole).lstrip("0b") + "."
    
    for x in range (x):
        converted_dec = dec
        while conveerted_dec > 1:
            converted_dec /= 10
        whole, dec = str(converted_dec * 2).split(".")
        dec = int(dec)
        out += whole
    return out