import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'dart:collection';

class Event {
  final DateTime date;
  Event({required this.date});
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

  final _events = LinkedHashMap(
    //데이터 베이스 연동하기
    equals: isSameDay,
  )..addAll({
      DateTime(2024, 5, 4): Event(date: DateTime(2024, 6, 4)),
      DateTime(2024, 5, 6): Event(date: DateTime(2024, 6, 6)),
      DateTime(2024, 5, 7): Event(date: DateTime(2024, 6, 7)),
      DateTime(2024, 5, 9): Event(date: DateTime(2024, 6, 9)),
      DateTime(2024, 5, 11): Event(date: DateTime(2024, 6, 11)),
      DateTime(2024, 5, 14): Event(date: DateTime(2024, 6, 14)),
    });

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
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
      },
      calendarBuilders: CalendarBuilders(
        dowBuilder: (context, day) {
          return Center(child: Text(days[day.weekday]));
        },
        markerBuilder: (context, date, events) {
          DateTime date1 = DateTime(date.year, date.month, date.day);
          if (_events.containsKey(date1)) {
            return Container(
              padding: const EdgeInsets.only(bottom: 5),
              width: MediaQuery.of(context).size.width * 0.065,
              decoration: const BoxDecoration(
                border: Border.fromBorderSide(
                    BorderSide(color: Color.fromARGB(255, 105, 105, 105))),
                color: Color.fromARGB(0, 244, 67, 54),
                shape: BoxShape.circle,
              ),
            );
          }
          return null;
        },
      ),
    );
  }
}
// List<Event> _getEventsForDay(DateTime day) {
//   return events[day] ?? [];
// }
