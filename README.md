ijc
===

Interactive Java Console which enables to quickly run/verify java statements without the need of .java files, compiling using javac and running using java. 


Installation 
------------

Checkout or download <code>ijc.sh</code> file and add it to your path. This tool is verified in Mac only at this time. 


Usage
-----

Run following command in Mac terminal: 
```bash
$ sh ijc.sh 
ijc (Interactive Java Console) v0.1
java version "1.7.0_55"
Java(TM) SE Runtime Environment (build 1.7.0_55-b13)
Java HotSpot(TM) 64-Bit Server VM (build 24.55-b03, mixed mode)

ijc> 
```

Try <code>System.out.println</code>: 
```java
ijc> System.out.println("Hello World!")
Hello World!
ijc> 
```

Use <code>``</code> to start and end multi-line statements: 
```java
ijc> ``
int times = 5; 
for (int i = 0; i < times; i++) { 
  System.out.println(i + ": Hello"); 
} 
``
0: Hello
1: Hello
2: Hello
3: Hello
4: Hello
ijc> 
```

Use arrow keys to move cursor left or right and also to see last used statements (history). 

This tool caches the statements and appends to current runtime. For an example: 
```java 
ijc> String name = "Hello"; 
ijc> name += " World"; 
ijc> int times = 3; 
ijc> for (int i = 0; i < times; i++) { System.out.println(name); } 
Hello World
Hello World
Hello World
ijc> 
```

Imports: 
--------
This tool currently imports following packages by default: 
```java
java.util.*; 
java.io.*; 
java.math.*; 
```

Additional packages or classes can be added using <code>import</code> statements: 
```java
ijc> import java.lang.reflect.Method;
ijc>
```
Imported classes will be available current runtime context. 

Commands
--------
Type <code>help</code> to get list of commands available: 
```bash
ijc> help 
ijc help

Type java statements in ijc>  prompt and press ENTER to execute. Multiple statements can be entered by enclosing with 

help          - ijc help
show          - displays current statements from cache
reset         - resets statements cache
import <s>    - adds import statements to cache
cp | classpath <s>[:<s>...]
              - adds classpath to current cache, these will be added to classpath when running statements
print [s]     - shortcut for java System.out.println()
``            - start or end multi-line statements
exit | quit   - exit ijc

```

