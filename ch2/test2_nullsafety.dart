int data1 = 10;
int? data2;
//non-null 타입으로 이용되어야 하는데 변수 선언과 동시에 값을 줄 수는 없는 경우..
late int data3;

main(){
  // data1 = null;//error...
  data2 = 10;
  data2 = null;

  data1.isEven;
  data2?.isEven;

  bool? result = data2?.isEven;
  
  //casting... 타입적으로 nullable 이 non-null의 상위 타입이다..
  int data5 = 10;
  int? data6 = data5;//ok....암시적 캐스팅..
  int data7 = data2 as int;//명시적 캐스팅..
}
