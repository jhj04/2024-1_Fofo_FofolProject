import 'package:flutter/material.dart';
import 'activity_list.dart';

class Write extends StatefulWidget {
  const Write({super.key});

  @override
  State<Write> createState() => _WriteState();
}

class _WriteState extends State<Write> {
  TextEditingController title = TextEditingController();
  TextEditingController content = TextEditingController();
  Color back = const Color.fromARGB(28, 188, 236, 255);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: 932,
        decoration: BoxDecoration(
          color: back,
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Fofol",
              style: TextStyle(
                fontSize: 50,
                fontFamily: 'YES24GothicR',
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 20,
                ),
                const Text(
                  "활동명: ",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(width: 1),
                SizedBox(
                  width: 250,
                  child: TextField(
                    controller: title,
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: back,
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: back,
                        ),
                      ),
                      contentPadding: const EdgeInsets.all(10),
                    ),
                  ),
                ),
                const SizedBox(width: 30),
                Column(
                  children: [
                    const SizedBox(
                      width: 50,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 50,
                          child: TextButton(
                            onPressed: () {},
                            style: const ButtonStyle(),
                            child: const Text(
                              "#00",
                            ),
                          ),
                        ),
                        IconButton(
                            onPressed: () {}, icon: const Icon(Icons.check)),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 2,
            ),
            Container(
              width: 450,
              height: 1,
              decoration: const BoxDecoration(
                color: Color(0xFFC7B3D7),
              ),
            ),
            SizedBox(
              width: 400,
              child: TextField(
                controller: content,
                decoration: InputDecoration(
                  hintText: "활동에 대해 소개해 주세요.",
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: back,
                    ),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: back,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {});
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ActivityList(),
            ),
          );
        },
        backgroundColor: const Color(0xff636FA4),
        child: const Icon(Icons.save),
      ),
    );
  }
}
