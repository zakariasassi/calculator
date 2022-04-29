import 'package:calculator/buttuns.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> buttns = [
    'C',
    'DEL',
    '%',
    '/',
    '9',
    '8',
    '7',
    'x',
    '6',
    '5',
    '4',
    '-',
    '3',
    '2',
    '1',
    '+',
    '0',
    '.',
    'ANS',
    '=',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 219, 183, 225),
      body: Column(children: <Widget>[
        Expanded(child: Container()),
        Expanded(
            flex: 2,
            child: Container(
              child: Center(
                child: myButtuns(
                  textButton: "0",
                  color: Colors.pinkAccent.shade400,
                  textColor: Colors.white,
                ),
              ),
            )),
      ]),
    );
  }
}
