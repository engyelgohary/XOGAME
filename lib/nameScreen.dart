import 'package:flutter/material.dart';
import 'package:xogame/Xo%20Game.dart';

class PlayerName extends StatelessWidget {
  static String routeName = "Playerpage";
  String player1Name ='';
  String player2Name='';
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: Text('Welcome To Xo Game '),
     ),
     body: Padding(
       padding: const EdgeInsets.all(30),
       child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         crossAxisAlignment: CrossAxisAlignment.stretch,
         children: [
              TextField(
                onChanged: (value) {
                 player1Name = value;
                },
                decoration: InputDecoration(
                  labelText: 'Player 1 ',
                ),
              ),
           SizedBox(height: 15,),
           TextField(
             onChanged: (value) {
                player2Name = value;
             },
             decoration: InputDecoration(
               labelText: 'Player 2 ',
             ),
           ),
           SizedBox(height: 25,),
           ElevatedButton(onPressed: (){
             Navigator.of(context).pushNamed(Xogame.routeName,
                 arguments: playerNames(
                 playerName1: player1Name, playerName2: player2Name)
             );

           },
               child: Text("Let's Play",style: TextStyle(fontSize: 20),))
         ],
       ),
     ),
   );
  }

}