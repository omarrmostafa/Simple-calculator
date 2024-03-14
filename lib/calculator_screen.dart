import 'package:calculator/calc_button_math.dart';
import 'package:flutter/material.dart';

import 'calc_button.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String result = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.green, title: const Text("Calculator")),
      body: Column(children: [
        Container(
            height: 260,
            width: 390,
            alignment: Alignment.centerLeft,
            child: Text(
                          result,
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 50),
                        )),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(5),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CalcButtonMath("Ac", clear),
                const SizedBox(width: 7),
                CalcButtonMath("%", onOperatorClick),
                const SizedBox(width: 7),
                CalcButtonMath("/", onOperatorClick),
                const SizedBox(width: 7),
                CalcButtonMath("*", onOperatorClick),
              ],
            ),
          ),
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(5),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CalcButton("9", onButtonClick),
                const SizedBox(width: 7),
                CalcButton("8", onButtonClick),
                const SizedBox(width: 7),
                CalcButton("7", onButtonClick),
                const SizedBox(width: 7),
                CalcButtonMath("-", onOperatorClick),
              ],
            ),
          ),
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(5),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CalcButton("6", onButtonClick),
                const SizedBox(width: 7),
                CalcButton("5", onButtonClick),
                const SizedBox(width: 7),
                CalcButton("4", onButtonClick),
                const SizedBox(width: 7),
                CalcButtonMath("+", onOperatorClick),
              ],
            ),
          ),
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(5),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CalcButton("3", onButtonClick),
                const SizedBox(width: 7),
                CalcButton("2", onButtonClick),
                const SizedBox(width: 7),
                CalcButton("1", onButtonClick),
                const SizedBox(width: 7),
                CalcButton("0", onButtonClick),
              ],
            ),
          ),
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(15),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CalcButtonMath("=", onEqual),

                const SizedBox(width: 7),
              ],
            ),
          ),
        )
      ]),
    );
  }

  String operator = "";
  String lhs = "";

  String calculate(String lhs, String rhs, String operator) {
    int lHS = int.parse(lhs);
    int rHS = int.parse(rhs);
    if (operator == "+") {
      int res = lHS + rHS;
      return res.toString();
    } else if (operator == "-") {
      int res = lHS - rHS;
      return res.toString();
    } else if (operator == "/") {
      double res = lHS / rHS;
      return res.toString();
    } else if (operator == "*") {
      int res = lHS * rHS;
      return res.toString();
    } else if (operator == "%") {
      double res = (lHS / 100);
      return res.toString();
    }
    return "";
  }

  onEqual(txt) {
    result = calculate(lhs, result, operator);
    lhs = "";
    operator = "";
    setState(() {});
  }

  onOperatorClick(txt) {
    if (operator.isEmpty) {
      lhs = result;
    } else {
      String res = calculate(lhs, result, operator);
      lhs = res;
    }
    operator = txt;
    result = "";
    setState(() {});
  }

  onButtonClick(txt) {
    if (operator == "=") {
      operator = "";
      lhs = "";
      result = "";
    }
    result += txt;
    setState(() {});
  }

  clear(txt) {
    result = "";
    lhs = "";
    operator = "";
    setState(() {});
  }
}
