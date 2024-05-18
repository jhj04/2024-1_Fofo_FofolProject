## 테이블캘린더 pubspec.yaml 파일에 추가

```dart
dependencies:
  flutter:
    sdk: flutter
  table_calendar: ^3.0.9
```

## 캘린더 구현 코드 예시 (스크린 코드)

``` dart
import 'package:diary/widgets/main_calendar.dart';
import 'package:flutter/material.dart';

class MyDiaryScreen extends StatefulWidget {
  const MyDiaryScreen({Key? key}) : super(key: key);

  @override
  State<MyDiaryScreen> createState() => _MyCalendarScreenState();
}

class _MyCalendarScreenState extends State<MyDiaryScreen> {
  // 선택된 날짜를 저장하는 변수
  DateTime selectedDate = DateTime.utc(
    DateTime.now().year,  // 년
    DateTime.now().month, // 월
    DateTime.now().day, // 일
  );

  @override
  Widget build(BuildContext context) {
    // Scaffold를 사용하여 화면의 구조를 정의
    return Scaffold(
        appBar: AppBar(
          title: Text('Diary'), // 상단 앱 바에 표시될 타이틀 설정
        ),
        body: MainCalendar(
          selectedDate: selectedDate, // 위젯(MainCalendar)에 현재 선택된 날짜 전달
          onDaySelected: onDaySelected, // 위젯(MainCalendar)에서 날짜 선택 시 호출될 콜백 함수 설정
        ));
  }

  // MainCalendar에서 호출되는 콜백 함수로, 선택된 날짜를 업데이트
  void onDaySelected(DateTime selectedDate, DateTime focusedDate) {
    setState(() {
      this.selectedDate = selectedDate;
    });
  }
}

```

### 캘린더 위젯 생성


``` dart
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class MainCalendar extends StatelessWidget {
  final OnDaySelected onDaySelected;
  final DateTime selectedDate;


  MainCalendar({
    required this.onDaySelected,   // 날짜 선택 시 호출될 콜백 함수
    required this.selectedDate,택
### focused => 색상표시
