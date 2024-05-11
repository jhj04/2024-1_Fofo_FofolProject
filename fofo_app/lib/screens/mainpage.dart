import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              const SizedBox(
                width: double.infinity,
                // padding: EdgeInsets.all(15),
                height: 100,
                child: Center(
                  child: Text(
                    "Fofol",
                    style: TextStyle(
                      fontSize: 50,
                      fontFamily: 'YES24GothicR',
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      color: Color(0xFF647087),
                    ),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.topRight,
                margin: const EdgeInsets.all(20),
                child: IconButton(
                  icon: const Icon(Icons.settings),
                  iconSize: 50,
                  onPressed: () {},
                ),
              ),
            ],
          ),
          const SizedBox(
            width: 100,
            height: 30,
          ),
          const SizedBox(
            width: 300,
            height: 500,
            child: Calendar(),
          )
        ],
      ),
    );
  }
}

class Calendar extends StatelessWidget {
  const Calendar({super.key});

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      firstDay: DateTime.utc(2010, 10, 16),
      lastDay: DateTime.utc(2030, 3, 14),
      focusedDay: DateTime.now(),
      locale: 'ko-KR',
      daysOfWeekHeight: 30,
      headerStyle: const HeaderStyle(
        titleCentered: true,
        formatButtonVisible: false,
      ),
    );
  }
}
