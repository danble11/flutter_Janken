import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: JankenPage(),
    );
  }
}

class JankenPage extends StatefulWidget {
  const JankenPage({super.key});

  @override
  State<JankenPage> createState() => _JankenPageState();
}

class _JankenPageState extends State<JankenPage> {
String myHand = '✊';
String enemyHand = '✊';
String result = '';

void selectHamd(String selectedHand){
  myHand = selectedHand;
  print(myHand);
  generateEnemyHand();
  judge();
  setState(() {});
}

void generateEnemyHand(){
  var hands = ['✊', '✌️', '✋'];
  final randomIndex = Random().nextInt(3);
  enemyHand = hands[randomIndex];
}

void judge(){
  if(myHand == enemyHand){
    result = 'あいこ';
  } else if(myHand == '✊' && enemyHand == '✌️' || myHand == '✌️' && enemyHand == '✋' || myHand == '✋' && enemyHand == '✊'){
    result = '勝ち';
  } else {
    result = '負け';
  }
  setState(() {});
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('じゃんけん'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              result,
              style: TextStyle(
                fontSize: 32,
              ),
            ),
            SizedBox(height: 40),
            Text(
              '相手の手',
              style: TextStyle(
                fontSize: 24,
              ),
            ),
            Text(
              enemyHand,
              style: TextStyle(
                fontSize: 32,
              ),
            ),
            SizedBox(height: 40),
            Text(
              myHand,
              style: TextStyle(
                fontSize: 32,
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    selectHamd('✊');
                  },
                  child: Text('✊'),
                ),
                ElevatedButton(
                  onPressed: () {
                    selectHamd('✌️');
                  },
                  child: Text('✌️'),
                ),
                ElevatedButton(
                  onPressed: () {
                    selectHamd('✋');
                  },
                  child: Text('✋'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
