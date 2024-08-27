import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String output = "0";
  String _output = "0";
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = "";

  void buttonPressed(String buttonText) {
    if (buttonText == "C") {
      _output = "0";
      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else if (buttonText == "+" || buttonText == "-" || buttonText == "*" || buttonText == "/") {
      num1 = double.parse(output);
      operand = buttonText;
      _output = "0";
    } else if (buttonText == ".") {
      if (_output.contains(".")) {
        return;
      } else {
        _output += buttonText;
      }
    } else if (buttonText == "=") {
      num2 = double.parse(output);

      switch (operand) {
        case "+":
          _output = (num1 + num2).toString();
          break;
        case "-":
          _output = (num1 - num2).toString();
          break;
        case "*":
          _output = (num1 * num2).toString();
          break;
        case "/":
          _output = (num1 / num2).toString();
          break;
        default:
          return;
      }


      if (_output.contains(".") && _output.split(".")[1] == "0") {
        _output = _output.split(".")[0];
      }

      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else {
      if (_output == "0") {
        _output = buttonText;
      } else {
        _output += buttonText;
      }
    }

    setState(() {
      output = _output;
    });
  }

  Widget buildButton(String buttonText, Color color, {Color textColor = Colors.white}) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(10),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            padding: EdgeInsets.symmetric(vertical: 20),
          ),
          child: Text(
            buttonText,
            style: TextStyle(fontSize: 24, color: textColor),
          ),
          onPressed: () => buttonPressed(buttonText),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Calculator"),
        backgroundColor: Colors.black,
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              child: Text(
                output,
                style: TextStyle(fontSize: 60, color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: Divider(),
            ),
            Column(
              children: [
                Row(
                  children: [
                    buildButton("7", Colors.grey[850]!),
                    buildButton("8", Colors.grey[850]!),
                    buildButton("9", Colors.grey[850]!),
                    buildButton("/", Colors.orange),
                  ],
                ),
                Row(
                  children: [
                    buildButton("4", Colors.grey[850]!),
                    buildButton("5", Colors.grey[850]!),
                    buildButton("6", Colors.grey[850]!),
                    buildButton("*", Colors.orange),
                  ],
                ),
                Row(
                  children: [
                    buildButton("1", Colors.grey[850]!),
                    buildButton("2", Colors.grey[850]!),
                    buildButton("3", Colors.grey[850]!),
                    buildButton("-", Colors.orange),
                  ],
                ),
                Row(
                  children: [
                    buildButton(".", Colors.grey[850]!),
                    buildButton("0", Colors.grey[850]!),
                    buildButton("C", Colors.grey[850]!, textColor: Colors.redAccent),
                    buildButton("+", Colors.orange),
                  ],
                ),
                Row(
                  children: [
                    buildButton("=", Colors.orange),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
