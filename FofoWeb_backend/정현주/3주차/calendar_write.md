## pubspec.yaml 수정하기

```dart

dependencies:
  flutter:
    sdk: flutter

  cupertino_icons: ^1.0.2
  table_calendar: 3.0.7
  intl: 0.17.0
  drift: 2.1.0
  sqlite3_flutter_libs: 0.5.10
  path_provider: 2.0.11
  path: 1.8.3
  get_it: 7.2.0
  dio: 4.0.6
  provider: 6.0.3
  uuid: 3.0.6

dev_dependencies:
  flutter_test:
    sdk: flutter

  flutter_lints: ^2.0.0
  drift_dev: ^2.1.0 #// Drift 코드 생성 기능 관련 플러그인
  build_runner: ^2.2.0 #// 코드 생성 기능 제공 플러그인
```

## 할일 저장하기기

```dart
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import 'blocs/todoBloc/bloc.dart';

class TodoAdd extends StatefulWidget {
  _TodoAdd createState() => _TodoAdd();
}

class _TodoAdd extends State<TodoAdd> {
  // ignore: close_sinks
  
  //앞에서 생성된 Todo Bloc을 계속해서 사용을 할것이다.
  TodoBloc _todoBloc;

  //todo의 제목을 위한 컨트롤러, 설명을 위한 컨트롤러 그리고 내가 지정한 날짜를 위한 컨트롤러 이렇게 세가지를 선언한다.
  TextEditingController todo = TextEditingController();
  TextEditingController description = TextEditingController();
  String selectDate;

  //이것은 받아온 DateTime을 특정 형태로 바꾸는 방법이다.
  String formattedDate = DateFormat('yyyy년 MM월 dd일').format(DateTime.now());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //앞에서 생성된 블럭을 받아와 계속 해서 사용하게 된다.
    _todoBloc = BlocProvider.of<TodoBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BlocListener(
      listener: (BuildContext context, TodoState state) {},
      bloc: _todoBloc,
      //사실 BlcoBuilder의 경우 body 부분만 감싸주어도 충분하다.(appbar 부분에서는 변할것이 없기 때문이다.)
      child: BlocBuilder(
          bloc: _todoBloc,
          builder: (BuildContext context, TodoState state) {
            return Scaffold(
                appBar: AppBar(
                  centerTitle: true,
                  title: Text("Todo Add"),
                ),
                body: Container(
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                    //여기서 부터 메모까지는 간단하게 Text, TextField를 활용하는 것이다.
                      Container(
                          height: 30,
                          alignment: Alignment.centerLeft,
                          child: Text(
                            '할 일',
                            style: Theme.of(context).textTheme.display1,
                          )),
                      TextField(
                        decoration: InputDecoration(hintText: '무엇을 하실건가요'),
                        controller: todo,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 40, bottom: 10),
                        child: Text(
                          '메모',
                          style: Theme.of(context).textTheme.display1,
                        ),
                      ),
                      /*
                      특이한 점이 있다면 이부분에서는 TextField에 기본적으로 있는 border를 없애고
                      Cotainer로 감싸주어 richTextField 처럼 보이게 만들어 주었다는 것이다.
                      */
                      Container(
                        height: MediaQuery.of(context).size.height * 0.2,
                        padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          border: Border.all(
                            color: Colors.grey,
                            width: 0.7,
                          ),
                        ),
                        child: TextField(
                          cursorColor: Theme.of(context).primaryColor,
                          textInputAction: TextInputAction.newline,
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          controller: description,
                          textAlign: TextAlign.left,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: Text(
                          '날짜',
                          style: Theme.of(context).textTheme.display1,
                        ),
                      ),
                      /*여기서는 달력을 dialog로 보여주기 위한 작업이 들어가 있다.
                      하지만 너무 어렵게 생각할 필요가 없는 것이 flutter에서 이미 제공해주고 있기 때문이다.
                      그래서 onTab을 했을때 해당 기능을 불러와 사용하기만 하면 된다.
                       더불어 달력에서 날짜를 선택했을때 버튼에 날짜를 어떻게 블록을 이용하여
                       변경해주가에 대해서도 생각 해보야야 한다.*/
                      OutlineButton(
                        child: Container(
                          width: MediaQuery.of(context).size.width / 2.5,
                          height: 50,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Icon(Icons.calendar_today),
                              Text(formattedDate),
                            ],
                          ),
                        ),
                        onPressed: () {
                          _selectDate(context, state);
                        },
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      //버튼을 가장 밑으로 내려 버리기 위한 Expanded
                      //floating button을 사용하여도 상광이 없었을것 같다...
                      Expanded(
                        child: Container(),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 50),
                        child: Center(
                          child: RaisedButton(
                          //버튼의 모양을 동글동글하게 바꿔 주기 위한 부분이다.
                            shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(30.0),
                              side: BorderSide(color: Color(0xFF266DAC)),
                            ),
                            color: Color(0xFF266DAC),
                            // 이 부분을 통해서 todo에 반드시 데이터가 들어가야 함을 dialog글 통해 보여 줄수 있도록 하고
                            // 만약 todo 부분에 데이터가 있으면 저장하는 과정이 실행이 되도록 해야한다.
                            onPressed: () {
                            //add 이벤트가 실행될때는 각각의 controller의 값들을 불러와 전달하게 해주면 될것이다.
                            //id의 이런 간단한 todo List에서는 사용을 할 필요가 없어 0으로 설절을 해두었다.
                              if (todo.text.isNotEmpty) {
                                _todoBloc.add(TodoAddPressed(
                                    id: 0,
                                    todo: todo.text,
                                    desc: description.text,
                                    date: selectDate));
                                    Navigator.pop(context);
                              } else {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Text('할일 섹션을 반드시 채워 주세요!'),
                                        content: Text("Select button you want"),
                                        actions: <Widget>[
                                          FlatButton(
                                            child: Text('OK'),
                                            onPressed: () {
                                              Navigator.pop(context, "OK");
                                            },
                                          ),
                                        ],
                                      );
                                    });
                              }
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width / 2.5,
                              height: 55,
                              child: Row(
                                children: <Widget>[
                                  Icon(Icons.add),
                                  Text(
                                    '새로운 일정 추가하기',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ));
          }),
    );
  }
  
  //해당 메서드를 통하여 달력을 호출할수가 있다. 그리고 선택된 값으로 state를 업데이트 해주는 작업이 필요하게 될 것이다.
  Future<void> _selectDate(BuildContext context, TodoState state) async {
    DateTime d = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2050),
    );

    selectDate = DateFormat('yyyy-MM-dd').format(d);
    _todoBloc.add(AddDateChanged(date: selectDate));
  }
}
```
