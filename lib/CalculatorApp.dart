import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import 'package:math_expressions/math_expressions.dart';



class CalculatorApp extends StatefulWidget {
  const CalculatorApp({super.key});

  @override
  State<CalculatorApp> createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {

  double firstnum = 0.0;
  double secondnum = 0.0;
  var input = '';
  var output = '';
  var operation = '';

  onButtonClick(value) {
    if (value == "AC") {
      setState(() {
        input = '';
        output = '';
      });
    } else if (value == "<") {
      setState(() {
        input = input.substring(0, input.length - 1);
      });
    } else if (value == "=") {
      setState(() {
        var userInput = input;
        userInput = userInput.replaceAll("x", "*");
        try {
          Parser p = Parser();
          Expression exp = p.parse(userInput);
          ContextModel cm = ContextModel();
          var result = exp.evaluate(EvaluationType.REAL, cm);
          output = result.toString();
        } catch (e) {
          output = "Error";
        }
      });
    } else {
      setState(() {
        input += value;
      });
    }
  }






  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(child: Container(
            width: double.infinity,
              padding: EdgeInsets.all(12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(input, style:  TextStyle(
                  fontSize: 48,
                  color: Colors.white,
                ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(output, style:  TextStyle(
                  fontSize: 34,
                  color: Colors.white.withOpacity(0.7),
                ),
                ),
                SizedBox(
                  height: 30,
                )
              ],
            ),
          )
          ),





          Row(
            children: [
              button(text: "AC", buttonBGColor: Colors.white24, tcolor: Colors.orange),
              button(text: "<", buttonBGColor: Colors.white24, tcolor: Colors.orange),
              button(text: "",buttonBGColor: Colors.transparent),
              button(text: "/", buttonBGColor: Colors.white24, tcolor: Colors.orange),
            ],
          ),
          Row(
            children: [
              button(text: "7"),
              button(text: "8"),
              button(text: "9",),
              button(text: "x", buttonBGColor: Colors.white24, tcolor: Colors.orange),
            ],
          ),
          Row(
            children: [
              button(text: "4"),
              button(text: "5"),
              button(text: "6"),
              button(text: "-", buttonBGColor: Colors.white24, tcolor: Colors.orange),
            ],
          ),
          Row(
            children: [
              button(text: "1"),
              button(text: "2"),
              button(text: "3"),
              button(text: "+", buttonBGColor: Colors.white24, tcolor: Colors.orange),
            ],
          ),
          Row(
            children: [
              button(text: "%", buttonBGColor: Colors.white24, tcolor: Colors.orange),
              button(text: "0"),
              button(text: ".", buttonBGColor: Colors.white24, tcolor: Colors.orange),
              button(text: "=", buttonBGColor: Colors.orange),
            ],
          ),

        ],
      ),
    );
  }

  Widget button({
    text, tcolor = Colors.white, buttonBGColor = Colors.white10
}){
    return Expanded(child: Container(
      margin: EdgeInsets.all(8),
      child:
      ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12)
            ),
            padding: const EdgeInsets.all(22),
            primary: buttonBGColor
        ),
        onPressed: () => onButtonClick(text),
        child:  Text(text, style: TextStyle(
          fontSize: 18,
          color: tcolor,
          fontWeight: FontWeight.bold,
        ),
        ),
      ),
    )
    );
  }

}
