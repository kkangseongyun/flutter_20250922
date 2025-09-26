import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_lab/ch8/provider/models/todo.dart';

//Provider로 공개하기 위한 데이터..
class TodosModel extends ChangeNotifier {
  List<Todo> todos = [];

  void addTodo(Todo todo){
    todos.add(todo);
    //변경 순간 하위 위젯에 반영..
    notifyListeners();
  }

  void toggleTodo(Todo todo){
    var index = todos.indexOf(todo);
    todos[index].toggleCompleted();
    notifyListeners();
  }

  void deleteTodo(Todo todo){
    todos.remove(todo);
    notifyListeners();
  }
}

