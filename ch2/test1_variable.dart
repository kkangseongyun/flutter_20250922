main(){
  //모든 변수는 객체이다....
  int data1 = 10;
  print(data1.isEven);

  //int <-> double 간의 캐스팅을 논할 수 없다..
  //int 와 double 이 상하위 관계가 아니다.. 함수를 이용해서 타입을 변형시켜야 한다..
  double data2 = data1.toDouble();
  int data3 = 10.0.toInt();

  //string <-> int
  String data4 = "10";
  int data5 = int.parse(data4);
  String data6 = data5.toString();

  //dart 언어는 강형 언어이다.. 타입이 없을 수 없다..
  int a = 10;
  // a = "hello";//error

  //var 은 타입 유추 기법이다.. 대입되는 값에 의해 타입이 고정된다..
  var b = 10;
  // b = "hello";//error..

  //모든 타입 허용...
  dynamic c = 10;
  c = "hello";//ok....

  //var 은 대입되는 값으로 타입이 유추가 되는데.. 선언하면서 값을 안준다면?
  //dynamic 으로 유추된다..
  var d;
  d = 10;
  d = "hello";

  //List... 선언과 동시에 값 대입이 가능한 경우......................
  List list1 = [10, true, "hello"];
  list1[0] = 20;
  //타입 고정.. 제네릭으로..
  List<int> list2 = [10, 20];
  //사이즈 가변이다..
  list2.add(30);
  list2.forEach((element){
    print(element);
  });

  //사이즈를 고정하고 싶다면.. filled 라는 생성자..
  List list3 = List.filled(3, null);// 사이즈, 초기값..
  list3[0] = "hello";
  print("${list3[0]}, ${list3[1]}, ${list3[2]}");//hello, null, null
  // list3.add(10);//runtime error...
  //Unsupported operation: Cannot add to a fixed-length list

  //map..................
  Map map1 = {1: 10, "two": "hello"};
  print("${map1[1]}, ${map1["two"]}");

  Map<String, String> map2 = {"one":"hello", "two":"world"};
}