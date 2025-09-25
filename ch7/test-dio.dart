import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  //서버에서 받은 데이터..
  List datas = [];

  //페이징 개념을 적용하고 싶다...
  //List의 스크롤 정보를 활용해서.. 다음 페이지의 데이터가 필요하다는 판단을 해야 한다..
  //ListView에 설정하는 정보로.. ListView의 스크롤 정보가 유지되는 컨트롤러..
  ScrollController controller = ScrollController();

  //서버에 전송해야 하는 데이터..
  int page = 1;
  int seed = 1;

  //네크워킹이 필요한 순간 호출할 개발자 함수..
  //함수를 호출하자 마자 이 함수는 실제 데이터가 발생하지 않았다고 하더라도 자동으로 Future를 리턴
  //하게 된다.. 함수 호출한 곳은 동작 가능하고.. 이후에 실제 데이터 발생 순간에 콜백만 실행되게..
  Future<List<dynamic>> dioTest() async {
    try{
      var dio = Dio(BaseOptions(
        connectTimeout: Duration(seconds: 5),
        receiveTimeout: Duration(seconds: 5),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.acceptHeader: 'application/json'
        }
      ));

      //서버 요청...
      Response<dynamic> response = await dio.get(
        "https://randomuser.me/api/?seed=${seed}&page=${page}&results=20"
      );
      return response.data['results'];//서버에서 넘어노는 json의 키가 results 에 우리가
      //필요한 데이터가 있어서..
    }catch(e){
      print(e);
    }
    return [];
  }

  //ListView의 스크롤 정보가 변경될때의 이벤트 콜백 함수..
  scrollListener() async {
    if(controller.offset >= controller.position.maxScrollExtent &&
      !controller.position.outOfRange){
      //마지막까지 스크롤 한 경우..
      //페이지 번호 증가시켜서.. 서버에 다음 페이지 데이터 요청..
      page++;
      List result = await dioTest();
      //화면 갱신.. 추가..
      setState(() {
        datas.addAll(result);
      });
    }
  }

  //초기 데이터 획득...
  @override
  void initState() {
    super.initState();
    controller.addListener(scrollListener);
    dioTest().then((value){
      setState(() {
        datas = value;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  //refresh 이벤트 콜백..
  Future<void> refresh() async {
    page = 1;
    seed++;
    List result = await dioTest();
    setState(() {
      datas = result;
    });
  }
 


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Test'),
        ),
        body: RefreshIndicator(
          onRefresh: refresh,
          child: ListView.separated(
            controller: controller,
            itemCount: datas.length,
            itemBuilder: (BuildContext context, int position) {
              return ListTile(
                contentPadding: EdgeInsets.all(5),
                title: Text(
                    "${datas[position]["name"]["first"]} ${datas[position]["name"]["last"]}"),
                subtitle: Text(datas[position]["email"]),
                leading: CircleAvatar(
                  radius: 25,
                  child: ClipOval(
                    child:
                        Image.network(datas[position]["picture"]['thumbnail']),
                  ),
                ),
              );
            },
            separatorBuilder: (BuildContext context, int position) {
              return Divider(
                color: Colors.black,
              );
            },
          ),
        ),
      ),
    );
  }
}
