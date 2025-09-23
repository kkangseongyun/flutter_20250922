main(){
  //named parameter.... optional...
  //optional 로 선언하면 외부에서 값 전달이 안될 수도 있다..
  //nullable 로 선언하거나.. 만약 non-null로 선언하려면..  default 값 명시한다..
  void fun1(bool arg1, { String arg2 = "hello", int? arg3 }){ }

  fun1(true);
  fun1(true, arg2: "world", arg3: 10);
  fun1(true, arg3: 20, arg2: "world");
  fun1(true, arg3: 30);

  //positional parameter.............
  void fun2(bool arg1, [ String arg2 = "hello", int? arg3 ]){}
  fun2(true);
  // fun2(true, arg2: "world", arg3: 20);//error.이름 명시 안된다..
  fun2(true, "world");//이름 명시 안되고.. 순서에 의해서..
  // fun2(true, 30);//error...순서 문제로..
}