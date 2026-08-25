
import 'package:flutter/material.dart';
class PlayWidget extends StatelessWidget {
  String playText;
  int index;

  Function(int index) onTap;

   PlayWidget({super.key,required this.playText,required this.index,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        onTap(index);
      },
      child:
        playText=="x"?
        Image.asset("images/Vector 1.png")
        : playText=="o"?
        Image.asset("images/Ellipse 1.png")
        : SizedBox(width: 68,height: 68)
    );
  }




}
