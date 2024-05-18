### 달력이 바뀌었을 때, event
### 새로운 일정 추가 event

```dart
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class TodoListEvent extends Equatable {
  TodoListEvent([List props = const []]) : super(props);
}

class TodoPageLoaded extends TodoListEvent {
  @override
  String toString() {
    // TODO: implement toString
    return "TodoPageLoaded";
  }
}

class TodoListCheck extends TodoListEvent {
  final int index;

  TodoListCheck({@required this.index});

  @override
  String toString() {
    // TODO: implement toString
    return "TodoListCheck";
  }
}

//여기 밑의 두가지가 전 코드에서 새로이 추가된 두개의 이벤트이다.
// AddDateChagned의 경우 달력에서 날짜를 설정 하게 될 경우 일어나는 상황을 설정한것이다.
class AddDateChanged extends TodoListEvent {
  final String date;

  AddDateChanged({@required this.date});

  @override
  String toString() {
    // TODO: implement toString
    return "AddDateChanged {date : $date}";
  }
}
// TodoAddPressed의 경우 새로운 일정 추가하기 버튼이 눌렸을때 일어날 상황을 설정한 것이다.
// 여기서는 todo 의 id, todo 의 title, todo의 설명, 날짜를 받아 오게 된다.
class TodoAddPressed extends TodoListEvent {
  final int id;
  final String todo;
  final String date;
  final String desc;

  TodoAddPressed({
    @required this.id,
    @required this.todo,
    @required this.date,
    @required this.desc,
  });

  @override
  String toString() {
    // TODO: implement toString
    return "TodoListCheck {id : $id, todo : $todo, datd : $date, desc : $desc}";
  }
}

```
<br>
<br>

### 새로운 이벤트 관리
모델에 받아온 데이터 넣기 -> todolist에 넣기기

```dart
import 'package:bloc/bloc.dart';
import 'package:flutter_app_todo/blocs/todoBloc/bloc.dart';
import 'package:flutter_app_todo/models/todo_model.dart';

class TodoBloc extends Bloc<TodoListEvent, TodoState> {
  @override
  // TODO: implement initialState
  TodoState get initialState => TodoState.empty();

  @override
  Stream<TodoState> mapEventToState(TodoListEvent event) async* {
    // TODO: implement mapEventToState
    if (event is TodoPageLoaded) {
      yield* _mapTodoPageLoadedToState();
    } else if (event is TodoListCheck) {
      yield* _mapTodoListCheckToState(event.index);
    }
    //새로이 추가가 되는 부분입니다. 
    else if (event is AddDateChanged) {
      yield* _mapAddDateChangedToState(event.date);
    } else if (event is TodoAddPressed) {
      yield* _mapTodoAddPressedToState(
          event.id, event.todo, event.date, event.desc);
    }
  }

  Stream<TodoState> _mapTodoPageLoadedToState() async* {
    yield state.update(todoList: state.todoList);
  }

  Stream<TodoState> _mapTodoListCheckToState(int index) async* {
    Todo currentTodo = Todo(
        id: state.todoList[index].id,
        todo: state.todoList[index].todo,
        date: state.todoList[index].date,
        checked: state.todoList[index].checked == true ? false : true);

    List<Todo> cTodoList = state.todoList;
    cTodoList[index] = currentTodo;
    yield state.update(todoList: cTodoList);
  }
  
  //date를 넘겨 받아 바로 state를 업데이트를 해주면 끝이난다.
  Stream<TodoState> _mapAddDateChangedToState(String date) async* {
    yield state.update(date: date);
  }
  
  //추가 버튼을 눌렀을 때의 경우 Todo model로 새로이 만들어 주어야 하고 
  //그것을 원래 존재하는 리스트에 넣어준다. 
  //그리고 갱신된 리스트로 state를 업데이트 시켜준다.
  Stream<TodoState> _mapTodoAddPressedToState(
      int id, String todo, String date, String desc) async* {
    Todo newTodo =
        Todo(id: id, todo: todo, date: date, desc: desc, checked: false);

    List<Todo> currentTodo = state.todoList;
    currentTodo.add(newTodo);

    yield state.update(todoList: currentTodo);
  }
}
```
