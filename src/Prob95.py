divisors = {}
def divisorSum(x):
    return sum([i for i in range(1,x//2 +1) if x%i==0])

def chain(x):
    u=divisorSum(x)
    seen = set([u])
    m = x
    while True:
        if u == x:
            return (len(seen),m,seen)
        n = divisorSum(u)
        if u > 1000000 or n in seen:
            return (False,0,seen)
        seen.add(n)
    u = n
    m = min(u,m)

out = {}
for i in range(1,30000):
    c,m,s = chain(i)
    for j in s:
        out[j] = (c,m)
    if c:
        print i,out[i],list(s)