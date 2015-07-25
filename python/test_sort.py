
import time, sys
import argparse

def load(infile):
    a = []
    tstart = time.time()
    for line in open(infile):
        line = line.strip()
        if len(line) == 0: continue
        a.append(int(line))
    
    print 'load time spend %f s' % (time.time() - tstart)
    print 'array size %d' % len(a)
    
    return a

def quickSort(a, ibegin, iend):
    if ibegin >= iend: return
    tmp = a[ibegin]
    low, high = ibegin, iend
    while low != high:
        while low != high and a[high] >= tmp:
            high = high - 1
        if low != high: a[high] = a[low]
        while low != high and a[low] <= tmp:
            low = low + 1
        if low != high: a[low] = a[high]
    a[low] = tmp
    quickSort(a, ibegin, low - 1)
    quickSort(a, low + 1, iend)

if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('infile', help = 'random number file')
    args = parser.parse_args()
    a = load(args.infile)
    if len(a) <= 20:
        print a
    
    b = a[:]
    
    tstart = time.time()
    a.sort()
    print 'list.sort spend %f s' % (time.time() - tstart)
    if len(a) <= 20:
        print a
    
    a = b[:]
    tstart = time.time()
    quickSort(a, 0, len(a) - 1)
    print 'quick sort spend %f s' % (time.time() - tstart)
    if len(a) <= 20:
        print b
#         print a
