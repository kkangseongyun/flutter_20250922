class User {
  String? name;
  int? age;
  //생성자 매개변수로 멤버 초기화...
  // User(String name, int age){
  //   this.name = name;
  //   this.age = age;
  // }

  //위의 코드를 아래처럼 축약형태로..
  // User(this.name, this.age);

  //생성자 매개변수로 간단한 로직, 그 결과로 멤버 초기화... 초기화 영역에..
  User(String name, int age): this.name = name.toUpperCase(), this.age = age + 19;

  //named constructor...
  User.one(){ }
  User.two(this.name, this.age);
  //다른 생성자 호출(자신, 상위).. 초기화 영역에..
  User.three(String name, int age): this.two(name, age);
}

//이 클래스의 객체는 단 하나만 생성되게 강제..
class Singleton {
  int? data;
  //객체는 생성이 되어야 한다.. 생성자는 가져야 한다.. 내부에서만 이용되게..
  Singleton._privateConstructor();
  static final Singleton _instance = Singleton._privateConstructor();
  factory Singleton() => _instance;
}

main(){
  Singleton obj1 = Singleton();
  Singleton obj2 = Singleton();
  obj1.data = 10;
  obj2.data = 20;
  print("${obj1.data}, ${obj2.data}");
}
