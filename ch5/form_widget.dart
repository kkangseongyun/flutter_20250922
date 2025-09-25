import 'package:flutter/material.dart';

//유저 입력 데이터 저장 VO
class User {
  String? firstName = "";
  String? lastName = "";
}

class FormScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormScreenState();
  }
}

class FormScreenState extends State<FormScreen> {
  //Form 위젯의 식별자.. 필요한 순간 식별자를 이용해 Form의 State 획득...
  //위젯의 State 목적으로 key 를 만들 때는 LocalKey 는 불가하다.. GlobalKey 로 만들어야 한다..
  var formKey = GlobalKey<FormState>();
  var user = User();

  //유저 입력이 모두 유효한 상황에서 최종 유저 데이터를 처리하기 위해서..
  save() {
    print("${user.firstName}, ${user.lastName}");
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          //Form 을 이용한다면.. Form 과 상호 작용이 가능한 TextFormField를 사용해야..
          TextFormField(
            decoration: InputDecoration(labelText: "first name"),
            //Form - State 의 validate() 함수 호출 시점에 자동 호출된다..
            //매개변수가 유저가 입력한 데이터..
            //적절한 유효성 검증 로직 실행 후... 리턴 값이 중요..
            //null - valid
            //문자열 - invalid, 문자열은 유저에게 출력될 에러 메시지다..
            validator: (value){
              if(value?.isEmpty ?? false){
                return "please enter your first name";
              }
              return null;
            },
            //Form - State의 save() 함수 호출시 자동 호출..
            //매개변수는 유저 입력 데이터..
            onSaved: (value){
              user.firstName = value;
            },
          ),
          TextFormField(
            decoration: InputDecoration(labelText: "last name"),
            validator: (value){
              if(value?.isEmpty ?? false){
                return "please enter your last name";
              }
              return null;
            },
            onSaved: (value){
              user.lastName = value;
            },
          ),
          ElevatedButton(
              onPressed: (){
                //Form 의 State를 key 로 획득..
                var formState = formKey.currentState;
                //Form 하위의 위젯의 모든 validator 함수가 자동 호출된다..
                //모두 null이면 전체 유효 - true
                //하나라도 null이 아니면 전체 invalid - false
                if(formState?.validate() ?? false){
                  formState?.save();//Form 하위의 모든 onSaved() 함수 호출..
                  save();
                }
              },
              child: Text("save"),
          ),
        ],
      ),
    );
  }
}