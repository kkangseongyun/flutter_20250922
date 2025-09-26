import 'package:flutter/material.dart';
import 'package:flutter_lab/ch8/provider/providers/todos_model.dart';

import 'package:provider/provider.dart';

import 'add_screen.dart';
import '../models/todo.dart';
import '../widgets/todo_list.dart';

class TabScreen extends StatelessWidget {

  List<Todo> todos;
  TabScreen(this.todos);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TodoList(this.todos,),
    );
  }
}


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {//tab 화면 전환 animation

  late TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 3, vsync: this);//animation
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todos'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddTodoScreen(),
                ),
              );
            },
          ),
        ],
        bottom: TabBar(//tab button...
          controller: controller,
          tabs: <Widget>[
            Tab(text: 'All'),
            Tab(text: 'Active'),
            Tab(text: 'Complete'),
          ],
        ),
      ),
      //add........................
        //provider를 이용하기 위한 위젯... 제네릭 타입으로 선언된 provider 데이터 자동 전달.
      body: Consumer<TodosModel>(
        //두번째 매개변수에 제네릭 타입의 데이터 전달..
        builder: (context, model, child){
          return TabBarView(
            controller: controller,//TabBar(버튼) - TabBarView(본문)
            //두 위젯이 동일 controller를 지정하면 알아서 조정..
            children: [
              TabScreen(model.todos),
              TabScreen(model.todos.where((todo) => !todo.completed).toList()),
              TabScreen(model.todos.where((todo) => todo.completed).toList())
            ],
          );
        },
      )

      
    );
  }
}
