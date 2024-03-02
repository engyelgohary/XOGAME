import 'package:flutter/material.dart';
import 'package:xogame/buttonClick.dart';

class Xogame extends StatefulWidget {

  static String routeName = 'Xogame';

  @override
  State<Xogame> createState() => _XogameState();
}
class _XogameState extends State<Xogame> {
  List<String>textButton=['','','','','','','','',''];
  int player1Score = 0;
  int player2Score = 0;
  @override
  Widget build(context) {
    playerNames args = ModalRoute.of(context)?.settings.arguments as playerNames;
    return Scaffold(
      appBar: AppBar(
        title: Text("XO Game"),
        centerTitle: true,
      ),
      body:
      Column(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('${args.playerName1}(X)' ,style: TextStyle(fontSize: 25,
                        fontWeight: FontWeight.bold),),
                    Text('${player1Score}',style: TextStyle(fontSize: 20,
                        fontWeight: FontWeight.bold))
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('${args.playerName2}(O)' ,style: TextStyle(fontSize: 25,
                        fontWeight: FontWeight.bold),),
                    Text('${player2Score}',style: TextStyle(fontSize: 20,
                        fontWeight: FontWeight.bold))                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Buttonclick(text:textButton[0],index: 0,clickButton: ActionButton),
                Buttonclick(text: textButton[1],index: 1,clickButton: ActionButton),
                Buttonclick(text: textButton[2],index: 2,clickButton: ActionButton),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Buttonclick(text:textButton[3], index: 3,clickButton: ActionButton),
                Buttonclick(text: textButton[4],index: 4,clickButton: ActionButton),
                Buttonclick(text: textButton[5],index: 5,clickButton: ActionButton),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Buttonclick(text:textButton[6],index: 6,clickButton: ActionButton ),
                Buttonclick(text: textButton[7],index: 7,clickButton: ActionButton),
                Buttonclick(text: textButton[8],index: 8,clickButton: ActionButton),
              ],
            ),
          ),

        ],
      ),
    );
  }
  int counter = 0;
  void ActionButton(int index) {
    if(textButton[index].isNotEmpty){
      return;
    }
    if(counter % 2 == 0){
      textButton[index] = 'X';
    } else {
      textButton[index]='O';
    }
    counter++;
   if(CheckWinner('X')){
     player1Score+=5;
     initBoard();

   }else if(CheckWinner('O')){
     player2Score+=5;
     initBoard();
   } else if(counter == 9){
     initBoard();
   }
    setState(() {

    });

  }
  bool CheckWinner (String symbol){
    //row
    for(int i =0;i<9;i+=3){
     if(textButton[i]== symbol && textButton[i+1]==symbol&&textButton[i+2]==symbol){
       return true;
     }
    }
    //colum
    for(int i =0;i<3;i++){
      if(textButton[i]== symbol && textButton[i+3]==symbol&&textButton[i+6]==symbol){
        return true;
      }
    }
    if(textButton[0]== symbol && textButton[4]==symbol&&textButton[8]==symbol){
      return true;
    }
    if(textButton[2]== symbol && textButton[4]==symbol&&textButton[6]==symbol){
      return true;
    }
    return false;
  }
  void initBoard(){
    textButton=['','','','','','','','',''];
  counter =0;
  setState(() {

  });

  }
}
class playerNames {
  String playerName1;
  String playerName2;
  playerNames({required this.playerName1,required this.playerName2});
}

