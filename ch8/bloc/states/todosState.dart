import 'package:flutter/material.dart';

class Todo {
  String title;
  bool completed;

  Todo({required this.title, this.completed = false});

  void toggleCompleted(){
    completed = !completed;
  }
}

//bloc에 의해 관리, 발행되는 상태데이터.. 특별한 작성 규칙 없다..
//변경시 위젯 업데이트를 위한 특별한 처리 필요 없다..
class TodosState {
  List<Todo> todos;
  TodosState(this.todos);
}