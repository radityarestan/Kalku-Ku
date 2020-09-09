import 'package:flutter/foundation.dart';

class CalculatorBrain with ChangeNotifier {
  String _output = "0";
  List<double> number = [];
  List<String> operator = [];

  String get output => _output;

  set output(String newOutput) {
    if (newOutput == "AC") {
      _output = "0";
      number.clear();
      operator.clear();
    }

    else if (newOutput == "÷" ||
        newOutput == "×" ||
        newOutput == "-" ||
        newOutput == "+" ||
        newOutput == "=") {
      number.add(double.parse(_output));
      if (newOutput != "=") {
        operator.add(newOutput);
        _output = "";
      }

      else {
        runCalculator();
        dynamic prettierNumber = number[0] == number[0].round() ? number[0].round() : number[0];
        int idxOfComa = prettierNumber.toString().indexOf(".");
        if (!(prettierNumber is int) && prettierNumber.toString().substring(idxOfComa + 1).length > 5)
          _output = prettierNumber.toStringAsFixed(5);
        else if (prettierNumber.toString().length > 14)
            _output = prettierNumber.toStringAsExponential(2);
        else
          _output = prettierNumber.toString();
        number.clear();
      }

    }

    else if (newOutput == "%") {
      if (_output != "0")
        _output = (double.parse(_output) / 100).toString();
    }
    
    else if (newOutput == "+/-") {
      double output = double.parse(_output) * -1;
      if (output == output.round())
        _output = (output.round()).toString();
      else
        _output = output.toString();
    }

    else {
      if (_output.length == 1 && _output == "0")
        _output = newOutput;
      else {
        _output += newOutput;
      }
    }
    notifyListeners();
  }

  void runCalculator() {
    for (int idx = 0; idx < operator.length; idx++) {
      if (operator[idx] == "×" || operator[idx] == "÷") {
        double num1 = number[idx];
        double num2 = number[idx + 1];
        double result = 0.0;
        if (operator[idx] == "×")
          result = num1 * num2;
        else
          result = num1 / num2;

        number.removeRange(idx, idx + 2);
        operator.removeAt(idx);

        number.insert(idx, result);
        idx--;
      }
    }

    for (int idx = 0; idx < operator.length; idx++) {
      if (operator[idx] == "+" || operator[idx] == "-") {
        double num1 = number[idx];
        double num2 = number[idx + 1];
        double result = 0.0;
        if (operator[idx] == "+")
          result = num1 + num2;
        else
          result = num1 - num2;

        number.removeRange(idx, idx + 2);
        operator.removeAt(idx);

        number.insert(idx, result);
        idx--;
      }
    }
  }
}
