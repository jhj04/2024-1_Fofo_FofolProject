// import 'package:flutter/material.dart';
// import 'package:settings_ui/settings_ui.dart';

// class Setting extends StatelessWidget {
//   const Setting({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           Stack(
//             children: [
//               Container(
//                 width: double.infinity,
//                 // padding: EdgeInsets.all(15),
//                 height: 100,
//                 child: Center(
//                     child: Text(
//                         "Fofol",
//                         style: TextStyle(
//                           fontSize: 50,
//                           fontFamily: 'YES24GothicR',
//                           fontWeight: FontWeight.bold,
//                           fontStyle: FontStyle.italic,
//                           color: Color(0xFF647087),
//                         ),
//                       ),
//                   ),
//               ),
//               Container(
//                 alignment: Alignment.topRight,
//                 margin: EdgeInsets.all(20),
//                 child: IconButton(
//                   icon: Icon(Icons.settings),
//                   iconSize: 50,
//                   onPressed: (){},
//                 ),
//               ),
//             ],
//           ),
//           ListView(
//         children: [
//           ListTile(
//             title: Text('Notifications'),
//             trailing: Switch(
//               value: true, // 예시로 true 설정
//               onChanged: (bool value) {
//                 // 여기에 스위치 상태 변경에 따른 로직 추가
//               },
//             ),
//           ),
//           ListTile(
//             title: Text('Dark Mode'),
//             trailing: Switch(
//               value: false, // 예시로 false 설정
//               onChanged: (bool value) {
//                 // 여기에 스위치 상태 변경에 따른 로직 추가
//               },
//             ),
//           ),
//           ListTile(
//             title: Text('Language'),
//             trailing: DropdownButton<String>(
//               value: 'English', // 예시로 'English' 설정
//               onChanged: (String? newValue) {
//                 // 여기에 드롭다운 값 변경에 따른 로직 추가
//               },
//               items: <String>['English', 'Spanish', 'French', 'German']
//                   .map<DropdownMenuItem<String>>((String value) {
//                 return DropdownMenuItem<String>(
//                   value: value,
//                   child: Text(value),
//                 );
//               }).toList(),
//             ),
//           ),
//           // 다른 설정 옵션을 추가하려면 위와 같은 ListTile을 추가합니다.
//         ],
//       ),  
//       ],
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:fofo_app/mainpage.dart';

class Setting extends StatefulWidget {
  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  bool _labEnabled = true;
  bool _alarmEnabled = false;
  String _selectedLanguage = 'English';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(150),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppBar(
              backgroundColor: Colors.white,
              elevation: 0.0,
              centerTitle: true,
              actions: [ 
                Padding(
                  padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                  child: IconButton(
                  icon: const Icon(Icons.home_rounded,
                  color: Color(0xff636FA4), ),
                  iconSize: 50,
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => MainPage()));
                  },
                ),
                )],
              title: Text(
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
          ],
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(30.0),
        children: [
          ListTile(
            title: Text(
              '실험실',
                style: TextStyle(
                fontSize: 25,
                fontFamily: 'YES24GothicR',
                // fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                color: Color(0xFF647087),
              )),
            trailing: Switch(
              value: _labEnabled,
              onChanged: (bool value) {
                setState(() {
                  _labEnabled = value;
                });
              },
            ),
          ),
          ListTile(
            title: Text(
              '알림 설정',
                style: TextStyle(
                fontSize: 25,
                fontFamily: 'YES24GothicR',
                // fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                color: Color(0xFF647087),
              )
            ),
            trailing: Switch(
              value: _alarmEnabled,
              onChanged: (bool value) {
                setState(() {
                  _alarmEnabled = value;
                });
              },
            ),
          ),
          ListTile(
            title: Text(
              '라이센스',
                style: TextStyle(
                fontSize: 25,
                fontFamily: 'YES24GothicR',
                // fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                color: Color(0xFF647087),
              )
            ),
          ),
          ListTile(
            title: Text(
              '개인정보',
                style: TextStyle(
                fontSize: 25,
                fontFamily: 'YES24GothicR',
                // fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                color: Color(0xFF647087),
              )
            ),
          ),
          ListTile(
            title: Text(
              'Language',
              style: TextStyle(
                    fontSize: 25,
                    fontFamily: 'YES24GothicR',
                    // fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    color: Color(0xFF647087),
              )),
            trailing: DropdownButton<String>(
              value: _selectedLanguage,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedLanguage = newValue!;
                });
              },
              items: <String>['English', 'Korean', 'French']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
          Container(
            height: 100,
          ),
          ListTile(
            title: Text(
              '로그아웃',
                style: TextStyle(
                fontSize: 25,
                fontFamily: 'YES24GothicR',
                // fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                color: Color(0xFF647087),
              )
            ),
          ),
        ],
      ),
    );
  }
}