import 'package:flutter/material.dart';
import 'user.dart';

class TwoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //화면 이동시 전달된 데이터 획득...
    Map<String, Object> args = ModalRoute.of(context)?.settings.arguments as Map<String, Object>;

    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text('TwoScreen'),
          ),
          body: Container(
            color: Colors.green,
            child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('TwoScreen', style: TextStyle(color: Colors.white,fontSize: 30)),
                    Text("argument data : ${args['arg1']}, ${args['arg2']}, ${(args['arg3'] as User).name}"),
                    ElevatedButton(
                        onPressed: (){
                          Navigator.pushNamed(context, "/three");
                        },
                        child: Text("Go Three"),
                    ),
                    ElevatedButton(
                        onPressed: (){
                          Navigator.pop(context, "world");
                        },
                        child: Text("pop"),
                    ),
                  ],
                )
            ),
          ),
        )
    );
  }
}