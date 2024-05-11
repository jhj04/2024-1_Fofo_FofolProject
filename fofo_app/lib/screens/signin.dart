import 'package:flutter/material.dart';
import 'mainpage.dart';
import 'signup.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController logTid = TextEditingController();
  TextEditingController logTpassword = TextEditingController();
  String? id;
  String? password;
  bool isCorrect = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/background_image.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          width: 430,
          height: 932,
          margin: const EdgeInsets.only(left: 100, right: 100),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Fofo app",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontFamily: 'YES24GothicR',
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 100),
              TextField(
                decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey)),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  hintText: "User name",
                  hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
                  contentPadding: EdgeInsets.all(10),
                  fillColor: Colors.white,
                  filled: true,
                ),
                controller: logTid,
              ),
              const SizedBox(
                height: 5,
              ),
              TextField(
                obscureText: true,
                decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey)),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
                  contentPadding: EdgeInsets.all(10),
                  fillColor: Colors.white,
                  filled: true,
                ),
                controller: logTpassword,
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    id = logTid.text;
                    password = logTpassword.text;
                    print("id: $id");
                    print("password: $password");
                    if (isCorrect) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MainPage()));
                    }
                  });
                },
                child: Container(
                  width: 300,
                  margin: const EdgeInsets.only(left: 10, right: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(71),
                      color: const Color.fromRGBO(99, 111, 164, 100)),
                  child: const Text(
                    "로그인",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 23,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              const SizedBox(
                height: 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Signup()));
                    },
                    child: const Text("회원가입"),
                  ),
                  const Text(" / "),
                  GestureDetector(
                    onTap: () {
                      print("비밀번호 찾기");
                    },
                    child: const Text("비밀번호 찾기"),
                  ),
                  const Text(" / "),
                  GestureDetector(
                    onTap: () {
                      print("아이디 찾기");
                    },
                    child: const Text("아이디 찾기"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
