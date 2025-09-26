import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_lab/ch8/bloc/blocs/todosBloc.dart';

import '../states/todosState.dart';
import '../events/events.dart';


class TodoListItem extends StatelessWidget {
  final Todo todo;

  TodoListItem({required this.todo});

  @override
  Widget build(BuildContext context) {
    //add.....................
    TodosBloc todosBloc = BlocProvider.of<TodosBloc>(context);
    return ListTile(
      leading: Checkbox(
        value: todo.completed,
        onChanged: (bool? checked) {
          //add.....................
          //이벤트 발행..
          todosBloc.add(ToggleCompletedTodoEvent(todo));
        },
      ),
      title: Text(todo.title),
      trailing: IconButton(
        icon: Icon(
          Icons.delete,
          color: Colors.red,
        ),
        onPressed: () {
          //add.........................
          todosBloc.add(DeleteTodoEvent(todo));
        },
      ),
    );

  }
}
