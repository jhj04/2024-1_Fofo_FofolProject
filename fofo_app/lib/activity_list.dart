// import 'package:flutter/material.dart';
// import 'package:fofo_app/setting.dart';

// class Activity_List extends StatelessWidget {
//   const Activity_List({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: PreferredSize(
//         preferredSize: Size.fromHeight(150),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             AppBar(
//               backgroundColor: Colors.white,
//               elevation: 0.0,
//               centerTitle: true,
//               actions: [
//                 Padding(
//                   padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
//                   child: IconButton(
//                     icon: const Icon(
//                       Icons.settings,
//                       color: Color(0xff636FA4),
//                     ),
//                     iconSize: 50,
//                     onPressed: () {
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => Setting()));
//                     },
//                   ),
//                 )
//               ],
//               title: const Text(
//                 "Fofol",
//                 style: TextStyle(
//                   fontSize: 50,
//                   fontFamily: 'YES24GothicR',
//                   fontWeight: FontWeight.bold,
//                   fontStyle: FontStyle.italic,
//                   color: Color(0xFF647087),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(10.0),
//         child: GridView.builder(
//           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 3,
//             crossAxisSpacing: 10,
//             mainAxisSpacing: 10,
//             childAspectRatio: 1/1.5, // Adjust this ratio as needed
//           ),
//           itemCount: 12,
//           itemBuilder: (BuildContext context, int index) {
//             return Container(
//               color: Colors.grey[300],
//               child: const Center(
//                 child: Text(
//                   'Item',
//                   style: TextStyle(
//                     color: Colors.black,
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:fofo_app/setting.dart';

class ActivityList extends StatelessWidget {
  const ActivityList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int itemCount = 12; // 그리드뷰의 항목 개수를 관리

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
                  padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                  child: IconButton(
                    icon: const Icon(
                      Icons.settings,
                      color: Color(0xff636FA4),
                    ),
                    iconSize: 50,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Setting(),
                        ),
                      );
                    },
                  ),
                )
              ],
              title: const Text(
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
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 1 / 1.5,
          ),
          itemCount: 4,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              color: Colors.grey[300],
              child: const Center(
                child: Text(
                  'stack',
                  style: TextStyle(
                    fontFamily: 'YES24GothicR',
                    fontWeight: FontWeight.bold,
                    color: Color(0xff636FA4),
                    fontSize: 25,
                  ),
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        
        onPressed: () {
          itemCount++; // 항목 개수 증가
          // setState(() {}); // 변경 사항을 반영하려면 setState를 호출해야 함 (StatefulWidget 사용 시에만 가능)
        },
        backgroundColor: Color(0xff636FA4),
        child: const Icon(Icons.add),
      ),
    );
  }
}

