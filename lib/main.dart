import 'package:flutter/material.dart';

void main() {
  runApp(Calculator());
}

class Calculator extends StatelessWidget {
  const Calculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Crap Calculator',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: SimpleCalculator(),
    );
  }
}

class SimpleCalculator extends StatefulWidget {
  const SimpleCalculator({super.key});

  @override
  State<SimpleCalculator> createState() => _SimpleCalculatorState();
}

class _SimpleCalculatorState extends State<SimpleCalculator> {
  Widget buildButton(
      String buttonText, double buttonHeight, Color buttonColor) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1 * buttonHeight,
      color: buttonColor,
      child: TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.all(16.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0.0),
            side: BorderSide(
                color: Colors.white, width: 1, style: BorderStyle.solid),
          ),
        ),
        onPressed: null,
        child: Text(
          buttonText,
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.normal, color: Colors.white),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Crap Calculator"),
        ),
      ),
      body: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
            child: Text(
              "0",
              style: TextStyle(fontSize: 38),
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.fromLTRB(10, 30, 10, 0),
            child: Text(
              "0",
              style: TextStyle(fontSize: 48),
            ),
          ),
          Expanded(
            child: Divider(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width * .75,
                child: Table(
                  children: [
                    TableRow(
                      children: [
                        buildButton("C", 1, Colors.redAccent),
                        buildButton("<<", 1, Colors.teal),
                        buildButton("÷", 1, Colors.indigo),
                      ],
                    ),
                    TableRow(
                      children: [
                        buildButton("7", 1, Colors.blueGrey),
                        buildButton("8", 1, Colors.blueGrey),
                        buildButton("9", 1, Colors.blueGrey),
                      ],
                    ),
                    TableRow(
                      children: [
                        buildButton("4", 1, Colors.blueGrey),
                        buildButton("5", 1, Colors.blueGrey),
                        buildButton("6", 1, Colors.blueGrey),
                      ],
                    ),
                    TableRow(
                      children: [
                        buildButton("1", 1, Colors.blueGrey),
                        buildButton("2", 1, Colors.blueGrey),
                        buildButton("3", 1, Colors.blueGrey),
                      ],
                    ),
                    TableRow(
                      children: [
                        buildButton(".", 1, Colors.blueGrey),
                        buildButton("0", 1, Colors.blueGrey),
                        buildButton("00", 1, Colors.blueGrey),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.25,
                child: Table(
                  children: [
                    TableRow(
                      children: [
                        buildButton("×", 1, Colors.indigo),
                      ],
                    ),
                    TableRow(
                      children: [
                        buildButton("-", 1, Colors.indigo),
                      ],
                    ),
                    TableRow(
                      children: [
                        buildButton("+", 1, Colors.indigo),
                      ],
                    ),
                    TableRow(
                      children: [
                        buildButton("=", 2, Colors.pinkAccent),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
