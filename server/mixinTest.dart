import 'dart:io';

void main() {
  
  var a = new A();
  var b = new B();
  var c = new C();
  
  print(a.a);
  a.printA();
  
  print("");
  
  print(b.b);
  b.printB();
  
  print("");
  
  print(c.a);
  c.printA();
  print(c.b);
  c.printB();
}

class A {
  String a = "aaa";
  
  void printA() {
    print(a);
  }
}

class B {
  String b = "bbb";
  
  void printB() {
    print(b);
  }
}

class C extends A with B {
  
}

