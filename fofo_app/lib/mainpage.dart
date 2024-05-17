import 'package:flutter/material.dart';
import 'package:fofo_app/setting.dart';
import 'package:fofo_app/widgets/calendar_widget.dart';
import 'package:get/utils.dart';

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
                  icon: const Icon(Icons.settings,
                  color: Color(0xff636FA4), 
                  ),
                  iconSize: 50,
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Setting()));
                  },
                ),
              ),
            ],
          ),
          Stack(
            children:[ Container(
              width:450,
              height: 250,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(
                  begin : Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors:[
                    Color(0xffBCECFF),
                    Color(0xffC2BBFF), 
                  ],
                ),
              ),
              alignment: Alignment.center,
              child: Container(
                width:446,
                height: 246,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
              ), 
            ),
            Positioned(
              left:20,
              top:10,
              child: Container(
                height: 100,
              // child:Text("$username")
                  child:Text(
                    "현주's fofol",
                    style: TextStyle(
                      color: Color(0xff636FA4),
                      fontSize: 30,
                      ),
                  ),
              ),
            ),
              Positioned(
                top : 60,
                left : 20,
                child: Image.asset(
                  // 'assets/images/pic.png',
                  'assets/images/background_image.png',
                  width: 170,
                  height: 170,
                  fit:BoxFit.cover
                  ),
              ),
              Positioned(
                  top : 60,
                  left : 210,
                child: Column(
                  children: [
                    Container(
                      child: Text(
                        "주요 경력",
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'YES24GothicR',
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF647087),
                          ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(20),
                      child: Text(
                        "경력 1",
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'YES24GothicR',
                          color: Color(0xFF647087),),
                      ),
                    ),

                                        Container(
                      padding: EdgeInsets.all(20),
                      child: Text(
                        "경력 2",
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'YES24GothicR',
                          color: Color(0xFF647087),),
                      ),
                    ),
                  ],
                ),),
        ]),
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