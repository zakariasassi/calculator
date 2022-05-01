import 'package:calculator/buttuns.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

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
  var userInput = '';
  var userOutbut = '';

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
      backgroundColor: Color.fromARGB(255, 18, 18, 18),
      body: Column(children: <Widget>[
        Expanded(
            child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              SizedBox(
                height: 50,
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.all(20),
                child: Text(
                  userInput,
                  style: TextStyle(color: Colors.white, fontSize: 29),
                ),
              ),
              Container(
                alignment: Alignment.centerRight,
                padding: EdgeInsets.all(20),
                child: Text(
                  userOutbut,
                  style: TextStyle(color: Colors.white, fontSize: 29),
                ),
              ),
            ],
          ),
        )),
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
                          buttonTaped: () {
                            setState(() {
                              userInput = '';
                              userOutbut = '';
                            });
                          },
                          textButton: buttns[index],
                          color: Color.fromARGB(255, 255, 26, 26),
                          textColor: Color.fromARGB(255, 255, 255, 255),
                        );
                      } else if (index == 1) {
                        return myButtuns(
                          buttonTaped: () {
                            setState(() {
                              if (userInput != '') {
                                userInput = userInput.substring(
                                    0, userInput.length - 1);
                              }
                            });
                          },
                          textButton: buttns[index],
                          color: Color.fromARGB(255, 26, 255, 76),
                          textColor: Color.fromARGB(255, 255, 255, 255),
                        );
                      } else if (index == buttns.length - 1) {
                        return myButtuns(
                          buttonTaped: () {
                            setState(() {
                              userInput = userInput.replaceAll("x", "*");
                              Parser p = Parser();
                              Expression exp = p.parse(userInput);
                              ContextModel cm = ContextModel();
                              double eval =
                                  exp.evaluate(EvaluationType.REAL, cm);
                              userOutbut = eval.toString();
                            });
                          },
                          textButton: buttns[index],
                          color: Color.fromARGB(255, 26, 255, 76),
                          textColor: Color.fromARGB(255, 255, 255, 255),
                        );
                      } else {
                        return myButtuns(
                          buttonTaped: () {
                            setState(() {
                              userInput += buttns[index];
                            });
                          },
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
