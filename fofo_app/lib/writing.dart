import 'package:flutter/material.dart';

class Write extends StatelessWidget {
  Write({super.key});
  TextEditingController title = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Size SIZE = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(color: Color(0xFFBCECFF)),
        child: Column(children: [
          const Text(
            "Fofol",
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'YES24GothicB.ttf',
            ),
          ),
          Row(
            children: [
              const Text(
                "활동명: ",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                ),
              ),
              TextField(
                controller: title,
                decoration: const InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              TextButton(onPressed: () {}, child: const Text("#00")),
              IconButton(onPressed: () {}, icon: const Icon(Icons.check))
            ],
          ),
          const SizedBox(),
          Container(
            width: SIZE.width * 20,
          )
        ]),
      ),
    );
  }
}
