import 'package:flutter/material.dart';
import 'package:flutter_lab/ch8/provider/providers/todos_model.dart';

import 'package:provider/provider.dart';

import '../models/todo.dart';



class AddTodoScreen extends StatefulWidget {
  @override
  _AddTodoScreenState createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends State<AddTodoScreen> {
  final controller = TextEditingController();
  bool completedStatus = false;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void onAdd() {
    //add........................................
    //유저 입력 데이터 획득..
    String title = controller.text;
    bool completed = completedStatus;
    if(title.isNotEmpty){
      Todo todo = Todo(title: title, completed: completed);
      //provider에 등록..
      Provider.of<TodosModel>(context, listen: false).addTodo(todo);
      //화면을 이전 화면으로 자동 전환..
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Todo'),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  TextField(controller: controller),
                  CheckboxListTile(
                    value: completedStatus,
                    onChanged: (checked) => setState(() {
                          completedStatus = checked ?? false;
                        }),
                    title: Text('Complete?'),
                  ),
                  ElevatedButton(
                    child: Text('Add'),
                    onPressed: onAdd,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
