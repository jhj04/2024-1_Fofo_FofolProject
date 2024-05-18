import 'package:flutter/material.dart';

class FindIDandPassword extends StatefulWidget {
  const FindIDandPassword({super.key, isID, isPassword});
  @override
  State<FindIDandPassword> createState() => _FindIDandPasswordState();
}

class _FindIDandPasswordState extends State<FindIDandPassword> {
  bool isPasswordFind = false; //값 받아오기
  bool isIdFind = false; //값 받아오기

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  setState() {
                    isPasswordFind = true;
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
                ),
              ),
              const Text(
                "/",
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
                margin: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                ),
              ),
              const Column(),
            ],
          ),
        ],
      ),
    );
  }
}
