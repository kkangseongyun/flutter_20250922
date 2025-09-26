import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_lab/ch8/bloc/blocs/todosBloc.dart';
import 'package:flutter_lab/ch8/bloc/screens/home_screen.dart';


void main() => runApp(TodosApp());

class TodosApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //add.................................
    return BlocProvider<TodosBloc>(
      create: (context) => TodosBloc(),
      child: MaterialApp(
        home: HomeScreen(),
      ),
    );
  }
}