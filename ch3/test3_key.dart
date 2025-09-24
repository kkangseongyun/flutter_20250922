import 'package:flutter/material.dart';

main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp>{
  //화면을 구성하기 위한 위젯 목록..
  List<Widget> widgets = [
    //하위 stateful 위젯이 여러개라고 하더라도 일차적으로 타입으로 매핑..
    //타입이 다르다면 매핑에 문제 없다..
    // MyColorWidgetA(Colors.red),
    // MyColorWidgetB(Colors.blue),

    //동일 타입의 위젯 여러개.. 순서로 매핑한다.. 구조가 변경된 경우..
    //정확하게 state와 widget이 매핑되지 않을 수 있다..
    // MyColorWidgetA(Colors.red),
    // MyColorWidgetA(Colors.blue),

    //키가 지정이 된다면.. 키를 우선으로 이용.. 매핑된다..
    MyColorWidgetA(Colors.red, key: UniqueKey(),),
    MyColorWidgetA(Colors.blue, key: UniqueKey(),),
  ];
  onChange(){
    setState(() {
      //위젯 트리의 구조 변경..
      widgets.insert(1, widgets.removeAt(0));
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Key Test"),),
        body: Column(
          children: [
            Row(children: widgets,),
            ElevatedButton(onPressed: onChange, child: Text("toggle"))
          ],
        ),
      ),
    );
  }
}

class MyColorWidgetA extends StatefulWidget {
  Color color;
  MyColorWidgetA(this.color, { Key? key }): super(key: key);
  @override
  State<StatefulWidget> createState() {
    return MyColorStateA(color);
  }
}
class MyColorStateA extends State<MyColorWidgetA>{
  Color color;
  MyColorStateA(this.color);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: color,
        width: 150,
        height: 150,
      ),
    );
  }
}

class MyColorWidgetB extends StatefulWidget {
  Color color;
  MyColorWidgetB(this.color, { Key? key }): super(key: key);
  @override
  State<StatefulWidget> createState() {
    return MyColorStateB(color);
  }
}
class MyColorStateB extends State<MyColorWidgetB>{
  Color color;
  MyColorStateB(this.color);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: color,
        width: 150,
        height: 150,
      ),
    );
  }
}