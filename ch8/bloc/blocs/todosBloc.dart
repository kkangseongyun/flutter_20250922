import 'package:bloc/bloc.dart';
import '../events/events.dart';
import '../states/todosState.dart';

//제네릭 타입 : input(event) - output(state)
class TodosBloc extends Bloc<TodosEvent, TodosState>{
  //생성자 선언하면서 상위 생성자 호출시 매개변수로 상태의 초기값 명시..
  TodosBloc(): super(TodosState([])){
    //이벤트 등록..
    //AddTodoEvent 라는 이벤트가 발생이 되었다면..
    on<AddTodoEvent>((event, emit){
      //Bloc 클래스내에서 선언된 state : 자신들이 유지하는 상태데이터..
      List<Todo> newTodos = List.from(state.todos)
          ..add(event.todo);//신규 하나 추가..
      //발행.. 하위 위젯에 반영..
      emit(TodosState(newTodos));
    });

    on<DeleteTodoEvent>((event, emit){
      List<Todo> newTodos = List.from(state.todos)
          ..remove(event.todo);
      emit(TodosState(newTodos));
    });

    on<ToggleCompletedTodoEvent>((event, emit){
      List<Todo> newTodos = List.from(state.todos);
      int index = newTodos.indexOf(event.todo);
      newTodos[index].toggleCompleted();
      emit(TodosState(newTodos));
    });
  }
  //이벤트 발생시마다 호출.. 정보 전달 목적으로..
  @override
  void onTransition(Transition<TodosEvent, TodosState> transition) {
    super.onTransition(transition);
    print(transition);
  }
}