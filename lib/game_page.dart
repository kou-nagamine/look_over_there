import 'package:flutter/material.dart';
import 'enum.dart';
import 'dart:math';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {

  Hand? myHand;
  Hand? computerHand;
  Result? result;

  List<Hand> handlist = [Hand.up, Hand.down,Hand.left,Hand.right];

  void computerchange() {
    final random = Random();
    final randomNumber = random.nextInt(4);
    setState((){
      computerHand = handlist[randomNumber];
    });
  }

  void decidedResult() {
    if (myHand == null || computerHand == null){
      return;
    }
    final Result result;
    if(myHand == computerHand){
      result = Result.win;
    } else{
      result = Result.draw;
    }
    setState((){
      this.result = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              myHand?.text ?? 'myhand'
            ),
            Text(
              result?.text ?? 'result'
            ),
            Text(
              computerHand?.text ?? 'computerhand'
            )
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(width: 40),
          FloatingActionButton(
            onPressed: () {
              setState(() {
              myHand = Hand.up;
            });
            computerchange();
            decidedResult();
            },
            child: Text(
              Hand.up.text,
              style: TextStyle(fontSize: 30)
            ),
          ),
          SizedBox(width: 20),
          FloatingActionButton(
            onPressed: () {
              setState(() {
              myHand = Hand.down;
            });
            computerchange();
            decidedResult();
            },
            child: Text(
              Hand.down.text,
              style: TextStyle(fontSize: 30)
            ),
          ),
          SizedBox(width: 20),
          FloatingActionButton(
            onPressed: () {
              setState(() {
              myHand = Hand.left;
            });
            computerchange();
            decidedResult();
            },
            child: Text(
              Hand.left.text,
              style: TextStyle(fontSize: 30)
            ),
          ),
          SizedBox(width: 20),
          FloatingActionButton(
            onPressed: () {
              setState(() {
              myHand = Hand.right;
            });
            computerchange();
            decidedResult();
            },
            child: Text(
              Hand.right.text,
              style: TextStyle(fontSize: 30)
            ),
          ),
        ],
      )
    );
  }
}
