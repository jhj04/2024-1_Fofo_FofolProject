## 강의 링크
<a href> https://youtu.be/nGMWcFZJ-XQ?si=w7AQmI6HYMaowZyP </a>

## 내용 정리

데이터베이스 => MySql 사용

API와 앱 연동의 원리

- API란
   - 프론트엔드가 백엔드에게 무언가를 요청할 때, 필요한 사용 규칙을 제공하는 것
   - API를 개발하기 위해 PHP활용 예정

- 스마트폰의 앱  ==Request==>  PHP  ==Request==>  데이터베이스(서버)
- 데이터베이스(서버)  ==Response==>  PHP  ==Response==>  스마트폰의 앱
- 서버와의 통신 => PHP언어(백엔드 언어) 활용 예정 


### -백엔드 관련 부분은 이론을 제외하고는 우선 생략 예정-

#### api.dart 파일 생성

```dart

class API{
	static const hostConnect = " {api_new_members} ";
	static const hostConnectUser = " {$hostConnect/user} ";
	static const signup = " {$hostConnect/user/signup.php} ";
	static const validateEmail = "{$hostConnect/user/validate_email.php}";

```

API에 접근할 수 있도록 hostConnectUser 변수 생성 <br>
hostConnect활용해서 user폴더까지 접근 <br>
signup과정을 위해 signup.php에도 접근 가능해야 함 <br>

#### signup.dart 생성

```dart

Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: TextFormField(
                              controller: userNameController,
                              validator: (val) =>
                                  val == "" ? "Please enter username " : null,
                              decoration: InputDecoration(
                                  border: InputBorder.none, hintText: 'User'),
                            ),
                          ),
                        ),
                      ),

```

validate를 위해 Form 위젯, TextFormField 위젯 사용

<br>


```dart
class _SignupPageState extends State<SignupPage> {
  var formKey = GlobalKey<FormState>();

  var userNameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
```

상단에 globalkey, textcontroller 정의

<br>


```dart
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: TextFormField(
                              controller: emailController,
                              validator: (val) =>
                                  val == "" ? "Please enter email" : null,
                              decoration: InputDecoration(
                                  border: InputBorder.none, hintText: 'Email'),
                            ),
```
controller, validator 아규먼트 사용 및 삼항 연산자 사용(사용자가 원하는 값을 넣도록 유도)
<br>
<br>

```dart
checkUerEmail() async{
}
```
php의 서버 통신 후에 결과를 받게 되므로, <b>async 방식</b> 사용 <br>
http 패키지 필요 , 상단 import 해두기
<br>
<br>

```dart
  checkUserEmail() async {
    try {
      var response = await http.post(Uri.parse(API.validateEmail),
          body: {'user_email': emailController.text.trim()});

      if (response.statusCode == 200) {
        var responseBody = jsonDecode(response.body);

        if (responseBody['existEmail'] == true) {
          Fluttertoast.showToast(
            msg: "Email is already in use. Please try another email", // 중복되는 메일 있음
          );
        }else{
          saveInfo();
        }
      }
    } catch (e) {
      print(e.toString());
      Fluttertoast.showToast(msg: e.toString());
    }
  }
```

사용자가 서버로 데이터를 보내 회원가입 할 수 있도록 해야함 => http.post 메서드 <br>
validate email 전달 => Uri.parse <br>
body: {'user_email': emailController.text.trim()}); <br> 
=> 중복 체크 후 전달하기 위해 body  알규먼트 이용 / map 형태 데이터 <br>
=> emailController.text.trim() 텍스트필드의 이메일 주소 전달 <br>
=>  if (response.statusCode == 200) 성공 확인 여부 확인 <br>
=> if (responseBody['existEmail'] == true) 본격적 확인 <br>


#### user.dart 생성
```dart
class User{
  int user_id;
  String user_name;
  String user_email;
  String user_password;

  User(this.user_id, this.user_name, this.user_email, this.user_password);

  Map<String, dynamic> toJson() => {   // string => 키 dynamic => value값
    'user_id' : user_id.toString(),
    'user_name' : user_name,
    'user_email' : user_email,
    'user_password' : user_password
  };
}
```
정보를 json형식으로 전달 (map 데이터 형식) <br>
키네임 일치하게 지정해주기

<br>

```dart
  saveInfo() async {
    User userModel = User(1, userNameController.text.trim(),
        emailController.text.trim(), passwordController.text.trim());

    try {
      var res = await http.post(
        Uri.parse(API.signup),
        body: userModel.toJson()
      );

      if(res.statusCode == 200){
        var resSignup = jsonDecode(res.body);
        if(resSignup['success'] == true){
          Fluttertoast.showToast(msg: 'Signup successfully');
          setState(() {
            userNameController.clear();
            emailController.clear();
            passwordController.clear();  // 등록 이후에 clear 해주기
          });
        }else{
          Fluttertoast.showToast(msg: 'Error occurred. Please try again');
        }
      }
    } catch (e) {
      print(e.toString());
      Fluttertoast.showToast(msg: e.toString());
    }
  }
```
유사한 방식으로 코드 작성 후 test( ipv4 주소 확인해보기)
