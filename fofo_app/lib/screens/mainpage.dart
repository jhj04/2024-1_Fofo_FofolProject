import 'package:flutter/material.dart';
import 'package:fofo_app/widgets/calendar_widget.dart';

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
