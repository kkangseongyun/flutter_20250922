import 'package:flutter/material.dart';
import 'four_screen.dart';
import 'one_screen.dart';
import 'three_screen.dart';
import 'two_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/one",
      routes: {//이름과 위젯을 매핑.. 어디선가 이름을 명시하면 static 하게 화면전환이 되는 경우..
        "/one": (context) => OneScreen(),
        "/two": (context) => TwoScreen(),
      },
      //화면 전환 요청시 dynamic 한 처리가 필요한경우..
      //화면 전환 요청만 들어오면 아래의 함수가 호출되고.. 매개변수에 요청한 화면 정보가 포함된다..
      onGenerateRoute: (settings){
        if(settings.name == "/three"){
          //적절한 로직. 판단등 실행시키고..
          //이 함수에서 리턴시키는 Route 정보대로 화면전환이 된다..
          return MaterialPageRoute(
            builder: (context) => ThreeScreen(),
            settings: settings//자신이 받은 화면 전환 정보를 그대로 유지시켜서..
            //화면 전환시에.. 전달하는 argument 데이터가 있을 수도 있어서..
          );
        }else if(settings.name == "/four"){
          return MaterialPageRoute(
            builder: (context) => FourScreen(),
            settings: settings
          );
        }
        //만약.. 동일 이름의 라우팅 정보가..routs 와 onGenerateRoute 에 모두 설정이 되어 있다면..
        //onGenerateRoute의 설정을 따른다..
        //중첩 라우팅 정보 설정도 가능하다..
      },
    );
  }
}