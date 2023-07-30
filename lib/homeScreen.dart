import 'package:flutter/material.dart';
import 'dart:math';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin{
  int leftDiceNum = 1;
  int rightDiceNum = 1;
  late AnimationController _controller;
  late CurvedAnimation animation;

  @override
  void initState() {
    super.initState();
    animate();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  animate(){
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
        animation = CurvedAnimation(parent: _controller,curve: Curves.bounceOut);
        animation.addListener(() {
          setState(() {
          });
        });
        animation.addStatusListener((status) {
          if(status == AnimationStatus.completed){
              setState(() {
                leftDiceNum = Random().nextInt(6)+1;
                rightDiceNum = Random().nextInt(6)+1;
            });
              _controller.reverse();
          }
        });

  }

  void roll(){
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Container(
            child: Text('Dice App', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),)),

      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Expanded(
                  child: GestureDetector( onDoubleTap: roll,
                    child: Padding(
                      padding: EdgeInsets.all(15),
                      child: Image(height: 200 - (animation.value)*200,
                        image: AssetImage('assets/images/dice-$leftDiceNum.png',),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector( onDoubleTap: roll,
                    child: Padding(
                      padding: EdgeInsets.all(15),
                      child: Image(height: 200 - (animation.value)*200,
                        image: AssetImage(
                            'assets/images/dice-$rightDiceNum.png'),
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 50,),
            ElevatedButton(
              style: TextButton.styleFrom(backgroundColor: Colors.black, fixedSize: const Size(250, 50)),
              onPressed: roll,
              child: Text(
                'Roll the dice',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.0,),
              ),
            )
          ],
        ),
      ),
    );
  }
}