import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:secret_calculator/constants.dart';
import 'package:secret_calculator/functional/neumorphism.dart';

class CustomDrawer extends StatelessWidget {
  final Function closerDrawer;

  CustomDrawer({this.closerDrawer});

  @override
  Widget build(BuildContext context) {
    return Consumer<Neumorphism>(
      builder: (context, neumorphism, _) => Container(
        padding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height * 0.1),
        width: MediaQuery.of(context).size.width * 0.6,
        height: MediaQuery.of(context).size.height,
        color: neumorphism.isLightMode ? Color(0xFFF0F0F2) :  Color(0xB7000000),
        child: Column(
          children: <Widget>[
            CircleAvatar(
              radius: MediaQuery.of(context).size.width * 0.15,
              backgroundImage: AssetImage("images/radits.png"),
            ),
            Text(
              "Christian Raditya",
              style: kMyName,
            ),
            Text(
              "Software Developer",
              style: kMyHope,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.55,
              height: 20.0,
              child: Divider(
                color: Colors.white,
                thickness: 2.0,
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.03),
              child: ListTile(
                leading: Icon(
                  Icons.phone,
                  color: Colors.grey,
                ),
                title: Text(
                  "0812 1921 1430",
                  style: kMyContact,
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Card(
              margin: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.03),
              child: ListTile(
                leading: Icon(
                  Icons.email,
                  color: Colors.grey,
                ),
                title: Text(
                  "christian.raditya\n@ui.ac.id",
                  style: kMyContact,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
