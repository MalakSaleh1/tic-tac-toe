import 'package:flutter/material.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:xo/screens/play_widget.dart';
import 'dart:async';
import '../core/app_colors.dart';

class HomeScreen extends StatefulWidget {
  bool isXPlay;

   HomeScreen({super.key,required this.isXPlay});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> signs=[
    "","","",
    "","","",
    "","","",
  ];
  final StopWatchTimer _stopWatchTimer=StopWatchTimer(
    mode: StopWatchMode.countUp
  );

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [AppColors.cyan,AppColors.blue],end: Alignment.bottomCenter),
        ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(44),
                  ),
                  child: Center(
                      child: StreamBuilder(
                    stream: _stopWatchTimer.rawTime,
                    builder:(context,snapshot){
                      var value=snapshot.data??0;
                      var  text=StopWatchTimer.getDisplayTime(value,hours: false,milliSecond: false);
                      return Text(text,style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 32,
                    ),);}
                  )),
                ),
                SizedBox(height: 32,),
                Text("Player ${widget.isXPlay?"x":"o"}’s Turn",style: TextStyle(
                  color: Colors.white,
                  fontSize: 36,
                  fontWeight: FontWeight.w700
                ),),
                SizedBox(height: 24,),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(32),
                      color: Colors.white
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Expanded(
                                  child: InkWell(
                                    child: PlayWidget(
                                      onTap: onPlatTap,
                                     index: 0,
                                      playText: signs[0],
                                                                    ),
                                  ),
                                ),
                                VerticalDivider(
                                  color: AppColors.black,
                                ),
                                Expanded(child:
                                PlayWidget(
                                  onTap: onPlatTap,
                                  playText: signs[1],
                                  index: 1,)),
                                VerticalDivider(
                                  color: AppColors.black,
                                ),
                                Expanded(child:
                                PlayWidget(
                                onTap: onPlatTap,
                                playText: signs[2],
                                index: 2,))
                              ],
                            ),
                          ),
                          Divider(
                            height: 0,
                            color: AppColors.black,
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                Expanded(child:
                                PlayWidget(
                                  onTap: onPlatTap,
                                  playText: signs[3],
                                  index:3 ,)),
                                VerticalDivider(
                                  color: AppColors.black,
                                ),
                                Expanded(child:
                                PlayWidget(
                                  onTap: onPlatTap,

                                  playText:
                                    signs[4],
                                    index:4 ,)),
                                VerticalDivider(
                                  color: AppColors.black,
                                ),
                                Expanded(child: PlayWidget(
                                onTap: onPlatTap  ,
                                playText: signs[5],
                                index: 5,))
                              ],
                            ),
                          ),
                          Divider(
                            height: 0,
                            color: AppColors.black,
                          ),
                          Expanded(child: Row(
                            children: [
                              Expanded(child:
                              PlayWidget(
                              onTap: onPlatTap  ,
                              playText: signs[6],
                              index: 6,)),
                              VerticalDivider(
                                color: AppColors.black,
                              ),
                              Expanded(child: PlayWidget(
                              onTap: onPlatTap  ,
                              playText: signs[7],
                              index: 7,)),
                              VerticalDivider(
                                color: AppColors.black,
                              ),
                              Expanded(child: PlayWidget(
                              onTap: onPlatTap  ,
                              playText: signs[8],
                              index:8 ,))
                            ],
                          )),
                        ],
                      ),
                    ),
                  ),
                )
                
              ],
            ),
          ),
        ),
      ),
    );
  }

  int count=0;
  void onPlatTap(int index){
    if(signs[index].isNotEmpty){
      return;
    }
    if(widget.isXPlay){
      signs[index]="x";
      widget.isXPlay=false;
    }
    else if(widget.isXPlay==false){
      signs[index]="o";
      widget.isXPlay=true;
    }
    count++;
    if (count==1){
      _stopWatchTimer.onStartTimer();
    }
    setState(() {
    });
    checkWinner();
    if(winner.isNotEmpty){
      _stopWatchTimer.onStopTimer();
      showModalBottomSheet(
          context: context,
          showDragHandle: true,
          builder: (context){
            return Center(
              child: Column(
                children: [
                  PlayWidget(playText: winner=="x"?"x":"o", index: 1, onTap: (int value){})
                ],
              ),
            );
          }).then((value){
            count=0;
        signs=[
          "","","",
          "","","",
          "","","",
        ];
        winner="";
        _stopWatchTimer.onResetTimer();
        setState(() {

        });
      });
    }
    if(winner.isEmpty&& count==9){
      showModalBottomSheet(
          context: context,
          showDragHandle: true,
          builder: (context){
            return Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Container(
                      padding: EdgeInsets.all(24),
                      decoration: BoxDecoration(color: AppColors.cyan,borderRadius: BorderRadius.circular(12)),
                      child: Center(
                        child: Text("No Winer",style: TextStyle(
                          fontSize:24 ,
                          fontWeight: FontWeight.w600
                        ),),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }).then((value){
        count=0;
        signs=[
          "","","",
          "","","",
          "","","",
        ];
        winner="";
        _stopWatchTimer.onResetTimer();
        setState(() {

        });
      });

    }
  }

  String winner="";
  void checkWinner(){
    for(int i=0;i<9;i+=3){
      if(signs[i]=="x"&&signs[i+1]=="x"&&signs[i+2]=="x"){
        winner="x";
        return;
      }
      if(signs[i]=="o"&&signs[i+1]=="o"&&signs[i+2]=="o"){
        winner="o";
        return;
      }
    }

    for(int i=0;i<3;i++){
      if(signs[i]=="x"&&signs[i+3]=="x"&&signs[i+6]=="x"){
        winner="x";
        return;
      }
      if(signs[i]=="o"&&signs[i+3]=="o"&&signs[i+6]=="o"){
        winner="o";
        return;
      }
    }

    if(signs[0]=="x"&&signs[4]=="x"&&signs[8]=="x"){
      winner="x";
      return;
    }
    if(signs[0]=="o"&&signs[4]=="o"&&signs[8]=="o"){
      winner="o";
    }

    if(signs[2]=="x"&&signs[4]=="x"&&signs[6]=="x"){
      winner="x";
      return;
    }
    if(signs[2]=="o"&&signs[4]=="o"&&signs[6]=="o"){
      winner="o";
      return;
    }


  }






}
