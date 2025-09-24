import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

//overflow menu를 구성하기 위한 문자열..
const List<String> choices = [
  "신고", "공유하기", "숨기기"
];

class HeaderWidget extends StatelessWidget{

  //메뉴 클릭 이벤트 콜백...
  void select(String choice){
    Fluttertoast.showToast(
      msg: choice,
      //아래 설정은 플랫폼에 따라 적용되지 않을 수도 있다..
      toastLength: Toast.LENGTH_SHORT,//사라지는 시간..
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.black,
      textColor: Colors.white,
      fontSize: 16.0
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset("images/lab_instagram_icon_0.jpg"),
        Container(
          padding: EdgeInsets.only(left: 16),
          child: Text("instagram", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
        ),
        Spacer(),
        PopupMenuButton<String>(
          onSelected: select,
          itemBuilder: (context){//메뉴 구성을 위해서 자동 호출...
            return choices.map<PopupMenuItem<String>>((choice){
              return PopupMenuItem<String>(
                value: choice,//이 메뉴가 클릭되었을때 이벤트 콜백함수에 전달되는 값..
                child: Text(choice),//화면 구성 문자열..
              );
            }).toList();
          },
        ),
      ],
    );
  }

}