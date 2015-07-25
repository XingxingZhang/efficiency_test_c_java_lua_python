
This project compares the performance of C++, Java, Lua and Python on sorting random integers.

# Requirements / Dependencies (including configurations on my machine)
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

# Results (unit: second)
| Language | quick sort    | native sort algorithm |
| -------- |:-------------:|: -----:|
| C++      | right-aligned | $1600 |
| Java     | centered      |   $12 |
| Lua      | are neat      |    $1 |
| Python   | are neat      |    $1 |

