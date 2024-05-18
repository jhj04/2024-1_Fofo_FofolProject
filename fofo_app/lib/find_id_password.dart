import 'package:flutter/material.dart';

class FindIDandPassword extends StatefulWidget {
  const FindIDandPassword({super.key, isID, isPassword});
  @override
  State<FindIDandPassword> createState() => _FindIDandPasswordState();
}

class _FindIDandPasswordState extends State<FindIDandPassword> {
  bool isPasswordFind = true; //값 받아오기
  bool isIdFind = false; //값 받아오기
  TextEditingController id = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 100,
              ),
              GestureDetector(
                onTap: () {
                  setState() {
                    isPasswordFind = true;
                    isIdFind = false;
                  }
                },
                child: const Text(
                  "비밀번호 찾기",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'YES24GothicB.ttf',
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const Text(
                "  /  ",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'YES24GothicB.ttf',
                ),
              ),
              GestureDetector(
                  onTap: () {
                    setState(() {
                      isIdFind = true;
                      isPasswordFind = false;
                    });
                  },
                  child: const Text(
                    "아이디 찾기",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'YES24GothicB.ttf',
                    ),
                  )),
            ],
          ),
          Stack(
            children: [
              Container(
                alignment: Alignment.center,
                width: double.infinity,
                height: 500,
                margin: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              if (isIdFind)
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "비밀번호 찾기",
                        style: TextStyle(fontSize: 20),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                        controller: name,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: '이름',
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                        controller: email,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: '이메일',
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                        controller: phone,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: '전화번호',
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          print("찾기");
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey,
                          textStyle: const TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                          ),
                        ),
                        child: const Text("찾기"),
                      ),
                    ],
                  ),
                ),
              if (isPasswordFind)
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "비밀번호 찾기",
                        style: TextStyle(fontSize: 20),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                        controller: id,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: '아이디',
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                        controller: name,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: '이름',
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                        controller: email,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: '이메일',
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                        controller: phone,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: '전화번호',
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          print("찾기");
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey,
                          textStyle: const TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                          ),
                        ),
                        child: const Text("찾기"),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
