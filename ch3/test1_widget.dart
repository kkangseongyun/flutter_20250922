import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  //화면 구성을 목적으로 자동 호출.. 이 함수에서 리턴 시키는 widget 이 화면에 출력..
  @override
  Widget build(BuildContext context) {
    //보통의 경우.. MaterialApp 위젯을 앱 위젯 트리의 최 상위...
    //필수는 아니다.. 앱의 테마 설정, 라우팅(화면 전환)처리를 주 목적으로 하는 위젯..
    //사실상.. 필수, 위젯 트리 루트..
    return MaterialApp(
      //화면의 기본 구조. 사실상의 필수..
      home: Scaffold(
        appBar: AppBar(
          title: Text('First Widget Test'),
        ),
        body: Center(
          child: Column(//여러 위젯을 위아래로 나열..
            children: [
              MyStatelessWidget(),
              MyStatefulWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class MyStatelessWidget extends StatelessWidget {
  //상태를 가지지 못한다고 해서.. 변수 선언 및 함수에서 변수 값 변경이 안되는 것은 아니다..
  bool favorited = false;
  int favoritedCount = 10;

  //이벤트 콜백...
  void toggleFavorite(){
    //이벤트 발생시에.. 이 함수는 호출이 되고.. 로직에 의해 변수 데이터 변경은 되지만...
    //stateless 의 특성상 상태를 가지지 못함으로 자신의 변수 변경에 의한 화면 갱신은 불가능하다.
    print("stateless.... toggleFavorite....");
    if(favorited){
      favorited = false;
      favoritedCount -= 1;
    }else {
      favorited = true;
      favoritedCount += 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    print("stateless... build....");
    return Row(//여러 위젯을 가로방향으로 나열...
      children: [
        IconButton(
            onPressed: toggleFavorite,
            icon: (favorited ? Icon(Icons.star) : Icon(Icons.star_border)),
            color: Colors.red,
        ),
        Text("$favoritedCount"),
      ],
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  //StatefulWidget은 State를 가지는 위젯이다.. 자신의 State 객체를 결정하기 위해서 자동 호출..
  @override
  State<StatefulWidget> createState() {
    return MyState();
  }
}
class MyState extends State<MyStatefulWidget> {
  bool favorited = false;
  int favoritedCount = 10;

  void toggleFavorite(){
    print("state.... toggleFavorite....");
    //상태를 가지고 상태 값이 변경될 때 화면 갱신은 가능하지만... 상태와 관련없는 변수도 있을 수
    //있다.. 단순 변수 변경으로는 화면 갱신 안된다..
    //화면 갱신은 setState() 에 의해서..

    //화면 갱신을 위한 변수값 변경은 setState() 의 매개변수에 지정한 함수내에서 해야 한다..
    //setState() 는 비동기로 움직인다.. setState() 안에서 값을 변경하지 않으면.. 값이 변경되기
    //전에 화면 갱신될 수도 있다..
    //setState 안의 함수호출이 끝난 후에.. 화면 갱신을 한다..
    setState(() {
      if(favorited){
        favorited = false;
        favoritedCount -= 1;
      }else {
        favorited = true;
        favoritedCount += 1;
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    print("state... build....");
    return Row(//여러 위젯을 가로방향으로 나열...
      children: [
        IconButton(
          onPressed: toggleFavorite,
          icon: (favorited ? Icon(Icons.star) : Icon(Icons.star_border)),
          color: Colors.red,
        ),
        Text("$favoritedCount"),
      ],
    );
  }
}