import 'package:flutter/material.dart';

class ContactUsScreen extends StatefulWidget {
  static const String routeName = "/ContactUsScreen";
  @override
  _ContactUsScreenState createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contact Us"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 120.0,
          left: 20,
          right: 20,
        ),
        child: Container(
          alignment: Alignment.topCenter,
          child: Text(
            "agriot.EXF@gmail.com\n\n\n0900 - 78601",
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
