import 'package:flutter/material.dart';
// import 'package:fofo_app/colors/screen.colors.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    // backgroundColor : Colors.white;
    // backgroundColor: ScreenColors.mainblueColor;
    return Stack(
      alignment : AlignmentDirectional.topCenter,
      clipBehavior: Clip.none,
      children: [
        Positioned(
          top : -50,
          left: -100,
          child:Container(
            height : 300,
            width : 300,
            // child : Icon(Icons.gpp_good, color:Colors.green, size:48),
            decoration:BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color : Colors.black.withOpacity(0.5),
                  blurRadius: 5.0,
                  spreadRadius: 1.0,
                  offset: Offset(0,1),
                )
              ],
              gradient: LinearGradient(
                begin : Alignment.centerLeft,
                end : Alignment.centerRight,
                colors: [
                  Color(0xffBCECFF),
                  Color(0xffC2BBFF),
                ]
              ),
              shape: BoxShape.circle,
            ),
          ),
        ),
        Positioned(
          top : 500,
          right: -100,
          child:Container(
            height : 200,
            width : 200,
            // child : Icon(Icons.gpp_good, color:Colors.green, size:48),
            decoration:BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color : Colors.black.withOpacity(0.5),
                  blurRadius: 5.0,
                  spreadRadius: 1.0,
                  offset: Offset(0,1),
                ),
              ],
              gradient: LinearGradient(
                begin : Alignment.centerLeft,
                  end : Alignment.centerRight,
                colors: [
                  Color(0xffBCECFF),
                  Color(0xffC2BBFF),
                ]
              ),
              shape: BoxShape.circle,
            ),
          ),
        ),
        Positioned(
          top : 700,
          left: -100,
          child:Container(
            height : 300,
            width : 300,
            // child : Icon(Icons.gpp_good, color:Colors.green, size:48),
            decoration:BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color : Colors.black.withOpacity(0.5),
                  blurRadius: 5.0,
                  spreadRadius: 1.0,
                  offset: Offset(0,1),
                ),
              ],
              gradient: LinearGradient(
                  begin : Alignment.centerLeft,
                  end : Alignment.centerRight,
                  colors: [
                    Color(0xffBCECFF),
                    Color(0xffC2BBFF),
                  ]
              ),
              shape: BoxShape.circle,
            ),
          ),
        ),
        Positioned(
          top: 100,
            child: Text ('Fofol',
            style: TextStyle(
              fontSize: 65,
              fontWeight: FontWeight.w100,
              color: Color(0xff636FA4),
            ),
            ),
        ),
      ],

    );
  }
}
