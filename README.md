ijc
===

Interactive Java Console which enables to run java statements quickly without the need of .java files, compiling using javac and running using java. 


Installation 
------------

Checkout or download <code>ijc.sh</code> file and add it to your path. This is verified in Mac only at this time. 


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

Try running <code>println</code>: 
```bash
ijc> System.out.println("Hello World!")
Hello World!
ijc> 
```

To run multi-line statements, type <code>``</code> to start and end: 
```
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

