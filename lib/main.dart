import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xff00838f),
        appBar: AppBar(
          title: Center(child: Text('Roll the Dice')),
          backgroundColor: Color(0xff00838f),
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNum = 1;
  int rightDiceNum = 6;

  rollLeftDice() {
    setState(() {
      leftDiceNum = Random().nextInt(6) + 1;
    });

    print('Left is pressed, the number is $leftDiceNum');
  }

  rollRightDice() {
    setState(() {
      rightDiceNum = Random().nextInt(6) + 1;
    });

    print('Right is pressed, the number is $rightDiceNum');
  }

  rollAllDice() {
    rollLeftDice();
    rollRightDice();

    print('Both dice were rolled, Left: $leftDiceNum, Right: $rightDiceNum ');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: AnimatedContainer(
                  duration: Duration(seconds: 1),
                  child: FlatButton(
                    onPressed: () {
                      rollLeftDice();
                    },
                    padding: const EdgeInsets.all(0),
                    child: Image.asset('images/dice$leftDiceNum.png'),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: FlatButton(
                  onPressed: () {
                    rollRightDice();
                  },
                  padding: const EdgeInsets.all(0),
                  child: Image.asset('images/dice$rightDiceNum.png'),
                ),
              ),
            ),
          ],
        ),
        Divider(
          thickness: 2,
          height: 15,
          indent: 50,
          endIndent: 50,
          color: Colors.white.withOpacity(0.8),
        ),
        RaisedButton(
          onPressed: () {
            rollAllDice();
          },
          color: Colors.white,
          splashColor: Color(0xff00838f),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
            child: Text(
              'Roll All Dice',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 25,
                color: Color(0xff00838f),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// class DicePage extends StatelessWidget {}
