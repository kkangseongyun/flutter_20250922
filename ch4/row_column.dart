import 'package:flutter/material.dart';
import 'package:flutter_lab/ch4/widgets/content_widget.dart';
//우리 앱(package) 의 파일 import..
//상대 경로로...
// import './widgets/header_widget.dart';
//절대경로...
import 'package:flutter_lab/ch4/widgets/header_widget.dart';
import 'package:flutter_lab/ch4/widgets/icon_widget.dart';
import 'package:flutter_lab/ch4/widgets/image_widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Layout Test'),
        ),
        //화면을 구성하다가 가로/세로로 화면을 벗어나게 되면..
        //노란색/검색색 패턴의 경고가 출력된다..
        //스크롤 되게 해주어야 한다..
        //단일 위젯이 스크롤 되게 하려면 SingleChildScrollView
        //여려 위젯을 스크롤 되게 하려면 ListView
        body: SingleChildScrollView(
          child: Column(
            children: [
              HeaderWidget(),
              ImageWidget(),
              IconWidget(),
              ContentWidget(),
            ],
          )
        ),
      ),
    );
  }
}

