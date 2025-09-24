import 'package:flutter/material.dart';
import 'dart:convert';//json parsing...
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AssetTestWidget extends StatelessWidget {
  Widget makeTextAsset(context){
    //asset 파일을 읽어서 출력하고 싶다.. 시간이 오래 걸릴 수 있다..
    //시간이 오래걸리는 작업을 동기적으로 기다리기는 부담스럽다..
    //비동기로 처리..
    //미래에 발생하는 데이터라는 개념이 Future(data)
    //Future 데이터가 발생하는 순간.. 화면을 구성할 수 있는 위젯이 FutureBuilder
    return FutureBuilder<String>(
      future: DefaultAssetBundle.of(context).loadString("assets/text/my_text.txt"),
      //future에서 지정한 Future에 실제 데이터가 발생하는 순간 자동 호출... 두번째 매개변수가
      //데이터..
      builder: (context, snapshot){
        if(snapshot.hasData){
          return Text("asset text file : ${snapshot.data}");
        }
        return Text("");//최초에도 한번 호출된다..
      },
    );
  }

  Widget makeJsonAsset(context){
    return FutureBuilder<String>(
        future: DefaultAssetBundle.of(context).loadString("assets/text/data.json"),
        builder: (context, snapshot){
          if(snapshot.hasData){
            //json 문자열을 파싱해서..
            var root = json.decode(snapshot.data.toString());
            return Text("json file : ${root[0]['name']}");
          }
          return Text("");
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image(//위젯...
          image: AssetImage("assets/icon/user.png"),//provider.. 이미지 데이터 획득..
        ),
        //위의 축약형..
        Image.asset("assets/icon/user.png"),
        makeTextAsset(context),
        makeJsonAsset(context),
        //flutter icon...
        Icon(Icons.menu),//앱 빌드시에 로컬에 다운로드 되어.. 런타임 시점에는 로컬이다..
        Icon(FontAwesomeIcons.music, size: 30, color: Colors.pink,)
      ]

    );
  }
}