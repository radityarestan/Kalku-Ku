import 'package:flutter/material.dart';
import 'package:secret_calculator/constants.dart';

class CalculatorButton extends StatelessWidget {
  final String text;
  final Color textColor;
  final Color bgColor;
  final Function function;

  CalculatorButton({this.text, this.textColor, this.bgColor, this.function});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: text != "0"
          ? MediaQuery.of(context).size.width * 0.2
          : MediaQuery.of(context).size.width * 0.433,
      height: MediaQuery.of(context).size.width * 0.2,
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.width * 0.033),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius:
            BorderRadius.circular(MediaQuery.of(context).size.width * 0.1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 0.5,
            blurRadius: 8.0,
            offset: Offset(5, 5),
          ),
        ],
      ),
      child: Material(
        borderRadius:
            BorderRadius.circular(MediaQuery.of(context).size.width * 0.1),
        color: Colors.transparent,
        child: InkWell(
          borderRadius:
              BorderRadius.circular(MediaQuery.of(context).size.width * 0.1),
          splashColor: Color(0xFFe0e0e0),
          onTap: function,
          child: Container(
            padding: text == "0"
                ? EdgeInsets.only(
                    right: MediaQuery.of(context).size.width * 0.233)
                : null,
            child: Center(
              child: Text(
                text,
                style: kTextCalculatorButton(textColor),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
