import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:secret_calculator/components/calculator_button.dart';
import 'package:secret_calculator/constants.dart';
import 'package:provider/provider.dart';
import 'package:secret_calculator/functional/calculator_brain.dart';
import 'package:secret_calculator/functional/neumorphism.dart';

class CalculatorPage extends StatefulWidget {
  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  void _showDialog() {
    showDialog(
      context: context,
      builder: (_) => CupertinoAlertDialog(
        title: Text(
          "Can't enter more than 7 digits.",
          style: kAlertText,
        ),
        actions: <Widget>[
          CupertinoDialogAction(
            child: Text(
              "OK",
              style: TextStyle(
                fontFamily: "Ubuntu",
              ),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer<Neumorphism>(
        builder: (context, neumorphism, _) => Scaffold(
          backgroundColor:
              neumorphism.isLightMode ? Colors.white : Colors.black,
          body: Container(
            padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      neumorphism.isLightMode ? "Light Mode" : "Dark Mode",
                      style: neumorphism.isLightMode
                          ? kTextCalculatorMode(Colors.black)
                          : kTextCalculatorMode(Colors.white),
                    ),
                    Switch(
                      activeColor: Color(0xFF212429),
                      inactiveTrackColor: Color(0xFFC4C4C4),
                      value: neumorphism.isLightMode,
                      onChanged: (newValue) {
                        neumorphism.isLightMode = newValue;
                      },
                    ),
                  ],
                ),
                ChangeNotifierProvider<CalculatorBrain>(
                  create: (context) => CalculatorBrain(),
                  child: Consumer<CalculatorBrain>(
                    builder: (context, calculatorBrain, _) => Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width * 0.05,
                          ),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              calculatorBrain.output,
                              style: neumorphism.isLightMode
                                  ? kDisplayTextCalculator(
                                      Colors.black,
                                      calculatorBrain.output.length > 7 &&
                                              calculatorBrain.output.length < 15
                                          ? 35.0
                                          : 70.0)
                                  : kDisplayTextCalculator(
                                      Colors.white,
                                      calculatorBrain.output.length > 7 &&
                                              calculatorBrain.output.length < 15
                                          ? 35.0
                                          : 70.0),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            CalculatorButton(
                              text: "AC",
                              textColor: Colors.black,
                              bgColor: Color(0xFFC4C4C4),
                              function: () {
                                calculatorBrain.output = "AC";
                              },
                            ),
                            CalculatorButton(
                              text: "+/-",
                              textColor: Colors.black,
                              bgColor: Color(0xFFC4C4C4),
                              function: () {
                                calculatorBrain.output = "+/-";
                              },
                            ),
                            CalculatorButton(
                              text: "%",
                              textColor: Colors.black,
                              bgColor: Color(0xFFC4C4C4),
                              function: () {
                                if (calculatorBrain.output.length < 7)
                                  calculatorBrain.output = "%";
                                else
                                  _showDialog();
                              },
                            ),
                            CalculatorButton(
                              text: "÷",
                              textColor: neumorphism.operatorPadColor,
                              bgColor: Color(0xFFFF9F0B),
                              function: () {
                                calculatorBrain.output = "÷";
                              },
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            CalculatorButton(
                              text: "7",
                              textColor: neumorphism.numPadTextColor,
                              bgColor: neumorphism.numPadColor,
                              function: () {
                                if (calculatorBrain.output.length < 7)
                                  calculatorBrain.output = "7";
                                else
                                  _showDialog();
                              },
                            ),
                            CalculatorButton(
                              text: "8",
                              textColor: neumorphism.numPadTextColor,
                              bgColor: neumorphism.numPadColor,
                              function: () {
                                if (calculatorBrain.output.length < 7)
                                  calculatorBrain.output = "8";
                                else
                                  _showDialog();
                              },
                            ),
                            CalculatorButton(
                              text: "9",
                              textColor: neumorphism.numPadTextColor,
                              bgColor: neumorphism.numPadColor,
                              function: () {
                                if (calculatorBrain.output.length < 7)
                                  calculatorBrain.output = "9";
                                else
                                  _showDialog();
                              },
                            ),
                            CalculatorButton(
                              text: "×",
                              textColor: neumorphism.operatorPadColor,
                              bgColor: Color(0xFFFF9F0B),
                              function: () {
                                calculatorBrain.output = "×";
                              },
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            CalculatorButton(
                              text: "4",
                              textColor: neumorphism.numPadTextColor,
                              bgColor: neumorphism.numPadColor,
                              function: () {
                                if (calculatorBrain.output.length < 7)
                                  calculatorBrain.output = "4";
                                else
                                  _showDialog();
                              },
                            ),
                            CalculatorButton(
                              text: "5",
                              textColor: neumorphism.numPadTextColor,
                              bgColor: neumorphism.numPadColor,
                              function: () {
                                if (calculatorBrain.output.length < 7)
                                  calculatorBrain.output = "5";
                                else
                                  _showDialog();
                              },
                            ),
                            CalculatorButton(
                              text: "6",
                              textColor: neumorphism.numPadTextColor,
                              bgColor: neumorphism.numPadColor,
                              function: () {
                                if (calculatorBrain.output.length < 7)
                                  calculatorBrain.output = "6";
                                else
                                  _showDialog();
                              },
                            ),
                            CalculatorButton(
                              text: "-",
                              textColor: neumorphism.operatorPadColor,
                              bgColor: Color(0xFFFF9F0B),
                              function: () {
                                calculatorBrain.output = "-";
                              },
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            CalculatorButton(
                              text: "1",
                              textColor: neumorphism.numPadTextColor,
                              bgColor: neumorphism.numPadColor,
                              function: () {
                                if (calculatorBrain.output.length < 7)
                                  calculatorBrain.output = "1";
                                else
                                  _showDialog();
                              },
                            ),
                            CalculatorButton(
                              text: "2",
                              textColor: neumorphism.numPadTextColor,
                              bgColor: neumorphism.numPadColor,
                              function: () {
                                if (calculatorBrain.output.length < 7)
                                  calculatorBrain.output = "2";
                                else
                                  _showDialog();
                              },
                            ),
                            CalculatorButton(
                              text: "3",
                              textColor: neumorphism.numPadTextColor,
                              bgColor: neumorphism.numPadColor,
                              function: () {
                                if (calculatorBrain.output.length < 7)
                                  calculatorBrain.output = "3";
                                else
                                  _showDialog();
                              },
                            ),
                            CalculatorButton(
                              text: "+",
                              textColor: neumorphism.operatorPadColor,
                              bgColor: Color(0xFFFF9F0B),
                              function: () {
                                calculatorBrain.output = "+";
                              },
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            CalculatorButton(
                              text: "0",
                              textColor: neumorphism.numPadTextColor,
                              bgColor: neumorphism.numPadColor,
                              function: () {
                                if (calculatorBrain.output.length < 7)
                                  calculatorBrain.output = "0";
                                else
                                  _showDialog();
                              },
                            ),
                            CalculatorButton(
                              text: ".",
                              textColor: neumorphism.numPadTextColor,
                              bgColor: neumorphism.numPadColor,
                              function: () {
                                if (calculatorBrain.output.length < 7)
                                  calculatorBrain.output = ".";
                                else
                                  _showDialog();
                              },
                            ),
                            CalculatorButton(
                              text: "=",
                              textColor: neumorphism.operatorPadColor,
                              bgColor: Color(0xFFFF9F0B),
                              function: () {
                                calculatorBrain.output = "=";
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
