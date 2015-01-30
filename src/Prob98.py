import math
import json
anagrams = {}
with open('../p098_words.txt') as f:
    for i in f.read().split(","):
        i = i[1:-1]
        s = ''.join(sorted(i))
        if s in anagrams:
            anagrams[s].append(i)
        else:
            anagrams[s] = [i]
#pairs is all those words with an anagram in the list
pairs = filter(lambda x: len(x)>1,anagrams.values())
def isSquare(x):
    return round(math.sqrt(x))**2 == x
maxi = 0
for i in pairs:
    for j in range(32,32000):
        s = str(j*j)
        if len(s) > len(i[0]):
            break
        if len(s) == len(i[0]):
            m = dict(zip(i[0],s))       
            ab = map(lambda x: ''.join([m[v] for v in x]), i)
            if '0' in (ab[0][0],ab[1][0]) or len(set(m.values())) != len(m.values()):
                continue
            if isSquare(int(ab[1])):
                maxi = max(int(maxi),int(ab[0]),int(ab[1]))
print maxi