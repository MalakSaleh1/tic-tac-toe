import 'package:flutter/material.dart';
import 'package:xo/core/app_colors.dart';
import 'package:xo/screens/home_screen.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [AppColors.cyan,AppColors.blue],end: AlignmentGeometry.bottomCenter),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            Expanded(
              flex: 2,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset("images/bg.png"),
                  Text("Tix-Tac-Toe",style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                    fontSize: 40
                  ),)
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Text("Pick who goes first?",style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16,right: 16,bottom: 26),
                      child: Row(
                        spacing: 16,
                        children: [
                          Expanded(
                            child: InkWell(
                              borderRadius:BorderRadius.circular(32) ,
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen(isXPlay: true,)));
                              },
                              child: Container(
                                padding: EdgeInsets.all(39),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(32)
                                ),
                                child: Image.asset("images/Vector 1.png"),
                              ),
                            ),
                          ),
                          Expanded(
                            child: InkWell(
                              borderRadius: BorderRadius.circular(32),
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen(isXPlay: false,)));
                              },
                              child: Container(
                                padding: EdgeInsets.all(39),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(32)
                                ),
                                child: Image.asset("images/Ellipse 1.png"),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}
