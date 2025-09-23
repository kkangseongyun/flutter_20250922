import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(ParentWidget());

//최상위 위젯을 Stateful로 만드는 것은 바람직하지 않다.. 너무 많은 위젯이 새로 생성이 될 수 있어서
//테스트를 위해서.. 상위의 state 변경시에.. 하위가 어떤 lifecycle 변화가 되는지 확인 목적..
class ParentWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ParentState();
  }
}

class ParentState extends State<ParentWidget> {
  //상위 state에서 관리하는 상태 데이터.. 하위 위젯에 전파되어 하위에서도 이용하는 데이터 가정..
  int count= 0;

  void increment(){
    setState(() {
      count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Lifecycle Test"),
        ),
        body: Provider.value(//자신의 데이터를 하위에 전파시키기 위해서..
          value: count,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("I am parent widget, $count"),
                ElevatedButton(
                    onPressed: increment,
                    child: Text("increment")
                ),
                ChildWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ChildWidget extends StatefulWidget {
  ChildWidget(){
    print("ChildWidget.. constructor...");
  }
  @override
  State<StatefulWidget> createState() {
    return ChildState();
  }
}

//WidgetsBindingObserver - app의 lifecycle 테스트를 위해서..
class ChildState extends State<ChildWidget> with WidgetsBindingObserver{
  int count = 0;//상위에서 전파받을 데이터 가정..

  ChildState(){
    print("ChildState.. constructor...");
  }

  @override
  void initState() {
    super.initState();
    print("ChildState.. initState..");
    //이벤트 등록.. 화면에서 발생하는 유저 이벤트는.. build 의 위젯에.. 그 이외의..
    //앱의 상태 변경 이벤트.. 콜백 등록..
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    count = Provider.of<int>(context);//상위 데이터 획득..
    print("ChildState.. didChangeDependencies..");
  }

  @override
  Widget build(BuildContext context) {
    print("ChildState.. build...");
    return Text("I am child widget, $count");
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print("$state");
    // switch(state){
    //   case AppLifecycleState.paused:
    //     //.....
    //     break;
    //   case AppLifecycleState.resumed:
    //     //....
    //     break;
    //
    // }
  }
}

//최초로 화면에 출력되는 순간.............................
//I/flutter (10072): ChildWidget.. constructor...
// I/flutter (10072): ChildState.. constructor...
// I/flutter (10072): ChildState.. initState..
// I/flutter (10072): ChildState.. didChangeDependencies..
// I/flutter (10072): ChildState.. build...

//상위 위젯의 상태 변경.. 화면 갱신...
//I/flutter (10072): ChildWidget.. constructor...
// I/flutter (10072): ChildState.. didChangeDependencies..
// I/flutter (10072): ChildState.. build...
//==>위젯은 불변이다... 화면 갱신시에 매번 생성된다..
//==>State 는 메모리에 지속된다..

//앱이 화면에서 사라질때...
//I/flutter (10072): AppLifecycleState.inactive
// D/VRI[MainActivity](10072): visibilityChanged oldVisibility=true newVisibility=false
// I/flutter (10072): AppLifecycleState.hidden
// I/flutter (10072): AppLifecycleState.paused

//앱의 화면이 다시 나올때...
//I/flutter (10072): AppLifecycleState.hidden
// I/flutter (10072): AppLifecycleState.inactive
// I/flutter (10072): AppLifecycleState.resumed