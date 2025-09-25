import 'package:flutter/material.dart';
import 'user.dart';

class OneScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text('OneScreen'),
          ),
          body: Container(
            color: Colors.red,
            child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('OneScreen', style: TextStyle(color: Colors.white,fontSize: 30),),
                    ElevatedButton(
                      onPressed: () async{
                        //TwoScreen 으로 화면 이동시키고.. 되돌아 왔을때 결과를 받는다..
                        var result = await Navigator.pushNamed(
                            context,
                            "/two",
                            arguments: {//넘길 데이터가 있다면..
                              "arg1": 10,
                              "arg2": "hello",
                              "arg3": User("kim", "seoul")
                            }
                        );
                        print("one screen : result = $result");
                       
                      },
                      child: Text('Go Two'),
                    )
                  ],
                )
            ),
          ),
        )
    );
  }
}