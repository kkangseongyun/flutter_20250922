import '../states/todosState.dart';

//bloc에 발생시키기 위한 이벤트..
//특별한 규칙이 없다.. 식별만 되면 된다..
//enum 으로 식별하거나 클래스 타입으로 식별하거나..

//모든 이벤트 클래스를 동일 타입으로.. 이용하기 위해서..
abstract class TodosEvent {}

class AddTodoEvent extends TodosEvent {
  Todo todo;
  AddTodoEvent(this.todo);
}

class DeleteTodoEvent extends TodosEvent {
  Todo todo;
  DeleteTodoEvent(this.todo);
}

class ToggleCompletedTodoEvent extends TodosEvent {
  Todo todo;
  ToggleCompletedTodoEvent(this.todo);
}
