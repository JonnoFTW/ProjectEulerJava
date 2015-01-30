# by extension of the sum for an integer sequence,
# we can apply it in 2 dimensions by multiplying
# s = n*(n+1)/2 * m*(m+1)/2 
def subrec(m,n): return (m*n*(1+n)*(1+m))/4
print max([(subrec(x,y),(x*y)) for x in range(0,100) for y in range(0,100) if subrec(x,y) < 2*10**6])