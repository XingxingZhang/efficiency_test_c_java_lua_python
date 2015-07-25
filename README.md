
This project compares the performance of C++, Java, Lua and Python on sorting random integers.

# Experimental Setup
* ###Task <br />
Sort three sets of 10,000,000 randomly generated integers using all these languages.
For each language, two sorting algorithm will be tested:
..1. self-implmented quick sort. The tested quick sort algorithm is as follows (c++ for example)
```c++
void _quick_sort(int a[], int istart, int iend)
{
  if(istart >= iend)
    return;
  int low = istart, high = iend;
  int tmp = a[istart];
  while( low != high )
  {
    while(low != high && tmp <= a[high]) high --;
    if(low != high) a[low] = a[high];
    while(low != high && tmp >= a[low]) low ++;
    if(low != high) a[high] = a[low];
  }
  a[low] = tmp;
  _quick_sort(a, istart, low - 1);
  _quick_sort(a, low + 1, iend);
}

void quick_sort(int a[], int N)
{
  _quick_sort(a, 0, N-1);
}
```


* System <br />
```
1.7 GHz Intel Core i5
4 GB 1333 MHz DDR3
OS X 10.9.5 (13F34)
```

* G++ <br />
```
Configured with: --prefix=/Applications/Xcode.app/Contents/Developer/usr --with-gxx-include-dir=/usr/include/c++/4.2.1
Apple LLVM version 5.1 (clang-503.0.40) (based on LLVM 3.4svn)
Target: x86_64-apple-darwin13.4.0
Thread model: posix
```

* JDK <br />
```
java version "1.8.0_25"
Java(TM) SE Runtime Environment (build 1.8.0_25-b17)
Java HotSpot(TM) 64-Bit Server VM (build 25.25-b02, mixed mode)
```

* LuaJIT <br />
```
LuaJIT 2.1.0-alpha -- Copyright (C) 2005-2015 Mike Pall. http://luajit.org/

 _____              _     
|_   _|            | |    
  | | ___  _ __ ___| |__  
  | |/ _ \| '__/ __| '_ \ 
  | | (_) | | | (__| | | |
  \_/\___/|_|  \___|_| |_|

JIT: ON SSE2 SSE3 SSE4.1 fold cse dce fwd dse narrow loop abc sink fuse
```

* Python <br />
```
Python 2.7.5 (default, Mar  9 2014, 22:15:05) 
[GCC 4.2.1 Compatible Apple LLVM 5.0 (clang-500.0.68)] on darwin
```

# Results
| Language | Quick Sort    | Native Sort Algorithm | IO (load) | 
| -------- | ------------- | --------------------- | --------- |
| C++      | 1.09 | 0.95 | 1.48 |
| Java     | centered      |   $12 |
| Lua      | are neat      |    $1 |
| Python   | are neat      |    $1 |

