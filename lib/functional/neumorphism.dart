import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class Neumorphism with ChangeNotifier {
  bool _isLightMode = true;

  bool get isLightMode => _isLightMode;

  set isLightMode(newMode) {
    _isLightMode = newMode;
    notifyListeners();
  }

  Color get numPadColor => _isLightMode ? Color(0xFFF0F0F2) : Color(0xFF212429);

  Color get numPadTextColor => _isLightMode ? Colors.black : Colors.white;

  Color get operatorPadColor => _isLightMode ? Colors.white : Colors.black;
}