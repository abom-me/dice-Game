import 'dart:math';
import 'package:brmjha_dice/my_flutter_app_icons.dart';
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
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const MyHomePage(title: 'Dice By Mona Abdalli'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int diceNumber = 3;
  var img='images/dice1.png';
  press() {
    setState(() {
      diceNumber = Random().nextInt(6)+1;
      img='images/dice$diceNumber.png' ;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        elevation: 0,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 300,
              height: 300,
              child:Image.asset(img),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {
          setState(() {
            press();
          });
        },
        tooltip: 'Increment',
        child: const Icon(MyFlutterApp.dice,color: Colors.blueGrey,),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class Input extends StatelessWidget {
  const Input({Key? key, required this.controller, required this.hint}) : super(key: key);
final TextEditingController controller;
final String hint;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: false,
      readOnly: true,
      controller:controller ,
      decoration: InputDecoration(
        hintText: hint,
      ),
    );
  }
}

