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
                child: GridView.builder(
                    itemCount: buttns.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4),
                    itemBuilder: (BuildContext context, int index) {
                      if (index == 0) {
                        return myButtuns(
                          textButton: buttns[index],
                          color: Color.fromARGB(255, 255, 26, 26),
                          textColor: Color.fromARGB(255, 255, 255, 255),
                        );
                      } else if (index == 1) {
                        return myButtuns(
                          textButton: buttns[index],
                          color: Color.fromARGB(255, 26, 255, 76),
                          textColor: Color.fromARGB(255, 255, 255, 255),
                        );
                      } else {
                        return myButtuns(
                          textButton: buttns[index],
                          color: isTorF(buttns[index])
                              ? Colors.deepPurple
                              : Colors.deepPurple.shade50,
                          textColor: isTorF(buttns[index])
                              ? Colors.white
                              : Colors.deepPurple,
                        );
                      }
                    }))),
      ]),
    );
  }

  bool isTorF(String string) {
    if (string == "%" ||
        string == "/" ||
        string == "x" ||
        string == "-" ||
        string == "+" ||
        string == "=") {
      return true;
    }
    return false;
  }
}
