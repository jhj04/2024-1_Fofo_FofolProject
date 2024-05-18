import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'dart:collection';

class Event {
  final DateTime date;
  String title;
  String content;
  Event({required this.date, this.title = '', this.content = ''});
}

class Calendar extends StatefulWidget {
  const Calendar({Key? key}) : super(key: key);
  @override
  _Calendar createState() => _Calendar();
}

class _Calendar extends State<Calendar> {
  DateTime _now = DateTime.now();
  DateTime? _selectedDay;
  CalendarFormat _calendarFormat = CalendarFormat.month;
  List<String> days = ['_', '월', '화', '수', '목', '금', '토', '일'];
  bool isEvent = false;

  final _events = LinkedHashMap(
    //데이터 베이스 연동하기
    equals: isSameDay,
  )..addAll({
      DateTime(2024, 5, 4): Event(
        date: DateTime(2024, 6, 4),
        title: '활동1',
        content: '활동내용',
      ),
      DateTime(2024, 5, 6): Event(
        date: DateTime(2024, 6, 6),
        title: '활동2',
        content: '활동내용',
      ),
      DateTime(2024, 5, 7): Event(
        date: DateTime(2024, 6, 7),
        title: '활동3',
        content: '활동내용',
      ),
      DateTime(2024, 5, 9): Event(
        date: DateTime(2024, 6, 9),
        title: '활동4',
        content: '활동내용',
      ),
      DateTime(2024, 5, 11): Event(
        date: DateTime(2024, 6, 11),
        title: '활동5',
        content: '활동내용',
      ),
      DateTime(2024, 5, 14): Event(
        date: DateTime(2024, 6, 14),
        title: '활동6',
        content: '활동내용',
      ),
    });
  List<Event> getEventsForDay([DateTime? day]) {
    if (day != null) {
      return _events[day] ?? [];
    }
    return _events[_selectedDay] ?? [];
  }

  Event? makeTable(int index) {
    List<Event> events = getEventsForDay();
    Map map = events.asMap();
    return map[index];
  }

  Widget _buildTableCell(index) {
    return TableCell(
      child: Container(
        child: Builder(builder: (context) {
          if (makeTable(index) == null) {
            return const Text("");
          } else {
            return Text(makeTable(index)!.title);
          }
        }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TableCalendar(
          firstDay: DateTime.utc(2010, 10, 16),
          lastDay: DateTime.utc(2030, 3, 14),
          focusedDay: _now,
          locale: 'ko-KR',
          daysOfWeekHeight: 30,
          headerStyle: const HeaderStyle(
            titleCentered: true,
            formatButtonVisible: false,
          ),
          calendarStyle: const CalendarStyle(
            todayDecoration: BoxDecoration(
              color: Color.fromARGB(255, 171, 166, 219),
              shape: BoxShape.circle,
            ),
            selectedDecoration: BoxDecoration(
              color: Color.fromARGB(112, 171, 166, 219),
              shape: BoxShape.circle,
            ),
          ),
          selectedDayPredicate: (day) {
            return isSameDay(_selectedDay, day);
          },
          onDaySelected: (selectedDay, focusedDay) {
            if (!isSameDay(_selectedDay, selectedDay)) {
              setState(() {
                _selectedDay = selectedDay;
                _now = focusedDay;
              });
            }
            if (_events[selectedDay] != null) {
              setState(() {
                isEvent = true;
              });
            } else {
              setState(() {
                isEvent = false;
              });
            }
          },
          calendarFormat: _calendarFormat,
          onFormatChanged: (format) {
            if (_calendarFormat != format) {
              setState(() {
                _calendarFormat = format;
              });
            }
          },
          onPageChanged: (focusedDay) {
            _now = focusedDay;
            setState(() {});
          },
          calendarBuilders: CalendarBuilders(
            dowBuilder: (context, day) {
              return Center(child: Text(days[day.weekday]));
            },
            markerBuilder: (context, date, events) {
              DateTime date1 = DateTime(date.year, date.month, date.day);
              if (_events.containsKey(date1)) {
                return Container(
                  margin: const EdgeInsets.only(top: 40),
                  width: 5,
                  decoration: const BoxDecoration(
                    border: Border.fromBorderSide(
                        BorderSide(color: Color.fromARGB(255, 255, 0, 0))),
                    color: Color.fromARGB(255, 255, 0, 0),
                    shape: BoxShape.circle,
                  ),
                );
              }
              return null;
            },
          ),
          eventLoader: (day) {
            return getEventsForDay(day);
          },
        ),
        // Container(
        //   width: double.infinity,
        //   margin: const EdgeInsets.only(top: 10),
        //   decoration: BoxDecoration(
        //     color: Colors.white,
        //     borderRadius: BorderRadius.circular(10),
        //   ),
        //   child: Column(
        //     children: [
        //       if (_events[_selectedDay] != null && isEvent)
        //         Text("활동명: ${_events[_selectedDay].title}"),
        //       Text("활동내용: ${_events[_selectedDay].content}"),
        //     ],
        //   ),
        // ),
      ],
    );
  }
}
// List<Event> _getEventsForDay(DateTime day) {
//   return events[day] ?? [];
// }
