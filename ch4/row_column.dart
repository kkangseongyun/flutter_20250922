import 'package:flutter/material.dart';
//우리 앱(package) 의 파일 import..
//상대 경로로...
// import './widgets/header_widget.dart';
//절대경로...
import 'package:flutter_lab/ch4/widgets/header_widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Layout Test'),
        ),
        body: Column(
          children: [
            HeaderWidget(),
          ],
        ),
      ),
    );
  }
}

