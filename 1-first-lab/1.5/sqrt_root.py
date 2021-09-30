def sqrt_root(i,x):
    num = 1
    for j in range(0, i):
        x = (1/2)*(num+(x/num))
    return num