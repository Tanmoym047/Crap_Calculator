import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

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
      theme: ThemeData.dark(),
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
  String equation = "0";
  String result = "";
  String expression = "";
  double equationFontSize = 38;
  double resultFontSize = 48;

  buttonPressed(String buttonText) {
    setState(
      () {
        if (buttonText == "C") {
          equation = "0";
          result = "";
          equationFontSize = 38;
          resultFontSize = 48;
        } else if (buttonText == "<<") {
          equationFontSize = 48;
          resultFontSize = 38;
          equation = equation.substring(0, equation.length - 1);
          if (equation == "") {
            equationFontSize = 38;
            resultFontSize = 48;
            equation = "0";
          }
        } else if (buttonText == "=") {
          equationFontSize = 38;
          resultFontSize = 48;
          expression = equation;
          expression = expression.replaceAll("×", "*");
          expression = expression.replaceAll("÷", "/");
          try {
            Parser p = Parser();
            Expression exp = p.parse(expression);
            ContextModel cm = ContextModel();
            result = "${exp.evaluate(EvaluationType.REAL, cm)}";
          } catch (e) {
            result = "Error";
          }
        } else {
          equationFontSize = 48;
          resultFontSize = 38;
          if (equation == "0") {
            equation = buttonText;
          } else if (equation == "00") {
            equation = buttonText;
          } else {
            equation = equation + buttonText;
          }
        }
      },
    );
  }

  Widget buildButton(
      String buttonText, double buttonHeight, Color buttonColor) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1 * buttonHeight,
      color: buttonColor,
      child: TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.all(16.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(3),
            side: BorderSide(
                color: Colors.black87, width: 0.3, style: BorderStyle.solid),
          ),
        ),
        onPressed: () => buttonPressed(buttonText),
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
              equation,
              style: TextStyle(fontSize: equationFontSize),
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.fromLTRB(10, 30, 10, 0),
            child: Text(
              result,
              style: TextStyle(fontSize: resultFontSize),
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
                        buildButton("<<", 1, Colors.blueGrey),
                        buildButton("÷", 1, Colors.blueGrey),
                      ],
                    ),
                    TableRow(
                      children: [
                        buildButton("7", 1, Colors.transparent),
                        buildButton("8", 1, Colors.transparent),
                        buildButton("9", 1, Colors.transparent),
                      ],
                    ),
                    TableRow(
                      children: [
                        buildButton("4", 1, Colors.transparent),
                        buildButton("5", 1, Colors.transparent),
                        buildButton("6", 1, Colors.transparent),
                      ],
                    ),
                    TableRow(
                      children: [
                        buildButton("1", 1, Colors.transparent),
                        buildButton("2", 1, Colors.transparent),
                        buildButton("3", 1, Colors.transparent),
                      ],
                    ),
                    TableRow(
                      children: [
                        buildButton(".", 1, Colors.transparent),
                        buildButton("0", 1, Colors.transparent),
                        buildButton("00", 1, Colors.transparent),
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
                        buildButton("×", 1, Colors.blueGrey),
                      ],
                    ),
                    TableRow(
                      children: [
                        buildButton("-", 1, Colors.blueGrey),
                      ],
                    ),
                    TableRow(
                      children: [
                        buildButton("+", 1, Colors.blueGrey),
                      ],
                    ),
                    TableRow(
                      children: [
                        buildButton("=", 2, Colors.transparent),
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
