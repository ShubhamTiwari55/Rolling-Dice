import 'package:flutter/material.dart';
import 'dart:math';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>{
  int leftDiceNum = 1;
  int rightDiceNum = 1;
  @override
  void roll(){
    setState(() {
      leftDiceNum = Random().nextInt(6)+1;
      rightDiceNum = Random().nextInt(6)+1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dice App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(15),
                    child: Image(
                      image: AssetImage('assets/images/dice-$leftDiceNum.png'),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(15),
                    child: Image(
                      image: AssetImage(
                          'assets/images/dice-$rightDiceNum.png'),
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: roll,
                child: Text(
                  'Roll',
                  style: TextStyle(fontWeight: FontWeight.bold,),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}