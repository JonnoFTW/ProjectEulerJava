def bouncy(x):
    s = str(x)
    ss = "".join(sorted(s))
    sss = "".join(sorted(s,reverse=True))
    return not (s==ss or s==sss)
i,b = 100, 0
while True:
    i+=1
    if bouncy(i):
        b +=1
    if i*99 == b*100:
        break
    
print i,b,