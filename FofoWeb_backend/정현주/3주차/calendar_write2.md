```dart
import 'package:flutter_app_todo/models/todo_model.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';

class TodoState {
  final List<Todo> todoList;
  final String date;

  TodoState({
    @required this.todoList,
    @required this.date,
  });

  factory TodoState.empty() {
    return TodoState(
      todoList: [
        Todo(
            id: 0,
            todo: "토익 공부하기",
            date: "2020.02.27",
            checked: false,
            desc: "토익 공부 열심히 해야해..."),
        Todo(
            id: 1,
            todo: "swift인강듣기",
            date: "2020.02.27",
            checked: false,
            desc: "ios 위젯을 만들어야하는데..."),
        Todo(
            id: 2,
            todo: "양파 썰기",
            date: "2020.02.27",
            checked: false,
            desc: "양파야 너무 맵다..."),
        Todo(
            id: 3,
            todo: "가스비 내기!!",
            date: "2020.02.27",
            checked: false,
            desc: "통장에서 자동이체라니...으으으으 마음 아파."),
        Todo(
            id: 4,
            todo: "월세 내기!",
            date: "2020.02.27",
            checked: false,
            desc: "월세는 언제 내야 하더라..."),
        Todo(
            id: 5,
            todo: "영양제 챙겨 먹",
            date: "2020.02.27",
            checked: false,
            desc: "영양제를 꼭꼭 챙겨먹어요...특히 비타민 D가 필요해"),
      ],
      date: DateFormat('yyyy-MM-dd').format(DateTime.now()).toString(),
    );
  }

  TodoState update({
    List<Todo> todoList,
    String date,
  }) {
    return copyWith(
      todoList: todoList,
      date: date,
    );
  }

  TodoState copyWith({
    List<Todo> todoList,
    String date,
  }) {
    return TodoState(
      todoList: todoList ?? this.todoList,
      date: date ?? this.date,
    );
  }
}
```

데이터베이스 연동해서 순차적으로 들어갈 수 있도록 만들기 필요!
