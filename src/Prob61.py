from itertools import *
p3 = lambda x:x*(x+1)/2
p4 = lambda x:x*x
p5 = lambda x:x*(3*x-1)/2
p6 = lambda x:x*(2*x-1)
p7 = lambda x:x*(5*x-3)/2
p8 = lambda x:x*(3*x-2)
nums = dict()
for i in [p3,p4,p5,p6,p7,p8]:
    nums[i] = list(imap(str,dropwhile(lambda x: x< 1000,takewhile(lambda x: x< 10000,imap(i,count(1))))))
def solve():
    for h in permutations(nums.values()):
        for i in h[0]:
            for j in filter(lambda x:x.startswith(i[2:]),h[1]):
                for k in filter(lambda x:x.startswith(j[2:]),h[2]):
                   for l in filter(lambda x:x.startswith(k[2:]),h[3]):
                       for m in filter(lambda x:x.startswith(l[2:]),h[4]):
                           for n in filter(lambda x:x.startswith(m[2:]) and x.endswith(i[:2]),h[5]):
                               print i,j,k,l,m,n,sum(map(int,[i,j,k,l,m,n]))
                               return
solve()