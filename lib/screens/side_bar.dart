import 'package:flutter/material.dart';
import 'package:foldable_sidebar/foldable_sidebar.dart';
import 'package:provider/provider.dart';
import 'package:secret_calculator/components/custom_drawer.dart';
import 'package:secret_calculator/functional/neumorphism.dart';
import 'package:secret_calculator/screens/calculator.dart';
import 'package:swipedetector/swipedetector.dart';

class SideBar extends StatefulWidget {
  @override
  _SideBarState createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  FSBStatus statusDrawer;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Neumorphism>(
      create: (context) => Neumorphism(),
      child: SafeArea(
        child: Scaffold(
          body: SwipeDetector(
            onSwipeRight: (){
              setState(() {
                statusDrawer = FSBStatus.FSB_OPEN;
              });
            },
            onSwipeLeft: (){
              setState(() {
                statusDrawer = FSBStatus.FSB_CLOSE;
              });
            },
            child: FoldableSidebarBuilder(
              drawerBackgroundColor: Color(0xFFC4C4C4),
              drawer: CustomDrawer(
                closerDrawer: () {
                  statusDrawer = FSBStatus.FSB_CLOSE;
                },
              ),
              screenContents: CalculatorPage(),
              status: statusDrawer,
            ),
          ),
        ),
      ),
    );
  }
}
