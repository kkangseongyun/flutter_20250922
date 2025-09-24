import 'package:flutter/material.dart';

//overflow menu를 구성하기 위한 문자열..
const List<String> choices = [
  "신고", "공유하기", "숨기기"
];

class HeaderWidget extends StatelessWidget{

  //메뉴 클릭 이벤트 콜백...
  void select(String choice){

  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset("images/lab_instagram_icon_0.jpg"),
        Text("instagram"),
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