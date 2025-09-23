class MyClass {
  int no;
  MyClass(this.no);
  String sayHello(String name) { return "hello $name"; }
}
//클래스를 상속관계로...
class SubClass extends MyClass {
  SubClass(no): super(no);
}
//클래스를 인터페이스로..
class InterfaceClass implements MyClass {
  //implements에 선언된 멤버(생성자 제외)는 모두 추상형..
  int no = 10;
  String sayHello(String name){ return ""; }
}

mixin MyMixin {
  int mixinData = 10;
  void mixinFun(){}
}
class SomeClass with MyMixin {
  void fun1(){
    mixinData = 20;
    mixinFun();
  }
}