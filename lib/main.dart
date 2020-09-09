import 'package:flutter/material.dart';
import 'package:secret_calculator/screens/side_bar.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(
    MainApp(),
  );
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/" : (context) => SideBar(),
      },
    );
  }
}
