import 'package:flutter/material.dart';

class Buttonclick extends StatelessWidget {
  String text;
  int index;
  Function clickButton;
  Buttonclick({required this.text,required this.index,required this.clickButton});
  @override
  Widget build(BuildContext context) {
  return Expanded(
      child: Container(
        margin: EdgeInsets.all(5),
        child: ElevatedButton(onPressed: (){
          clickButton(index);
        },
            child:Text(text,style: TextStyle(fontSize: 35),)),
      )
  );

  }

}