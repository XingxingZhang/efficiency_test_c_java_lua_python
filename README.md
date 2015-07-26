This project compares the performance of C++, Java, Lua and Python on sorting random integers.

# Experimental Setup
### Task
Sort three sets of 10,000,000 randomly generated integers using all these languages.
For each language, two sorting algorithm will be tested:<br />
**1. self-implmented quick sort** <br /> 
The tested quick sort algorithm is implmented as follows (c++ for example)
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

**2. native sort algorithm** <br /> 
* C++: STL sort ([Musser’s introsort](https://en.wikipedia.org/wiki/Introsort))
* Java: Arrays.sort ([Dual-Pivot Quicksort by Vladimir Yaroslavskiy, Jon Bentley, and Joshua Bloch](http://docs.oracle.com/javase/8/docs/api/java/util/Arrays.html#sort-int:A-))
* Lua: table.sort ([quick sort](http://lua-users.org/wiki/LuaSorting))
* Python: list.sort ([Timsort](https://en.wikipedia.org/wiki/Timsort))


### System
```
1.7 GHz Intel Core i5
4 GB 1333 MHz DDR3
OS X 10.9.5 (13F34)
```

### G++
```
Configured with: --prefix=/Applications/Xcode.app/Contents/Developer/usr --with-gxx-include-dir=/usr/include/c++/4.2.1
Apple LLVM version 5.1 (clang-503.0.40) (based on LLVM 3.4svn)
Target: x86_64-apple-darwin13.4.0
Thread model: posix
```

### JDK
```
java version "1.8.0_25"
Java(TM) SE Runtime Environment (build 1.8.0_25-b17)
Java HotSpot(TM) 64-Bit Server VM (build 25.25-b02, mixed mode)
```

### LuaJIT
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

### Python
```
Python 2.7.5 (default, Mar  9 2014, 22:15:05) 
[GCC 4.2.1 Compatible Apple LLVM 5.0 (clang-500.0.68)] on darwin
```

# Run the Experiment
```
./run_test.sh
```

# Results
Note the time unit is **second**. The time is average over three runs. <br />

| Language | Quick Sort    | Native Sort Algorithm | IO (load) | 
| -------- | ------------- | --------------------- | --------- |
| C++      | 1.09 | 0.95 | 1.48 |
| Java     | 1.56 | 1.20 | 6.29 |
| Lua      | 2.92 | 6.25 | 6.30 |
| Python   | N/A  | 11.88 | 14.40 |


