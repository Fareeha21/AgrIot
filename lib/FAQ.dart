import 'package:flutter/material.dart';

class FAQScreen extends StatefulWidget {
  static const String routeName = "/FAQScreen";
  @override
  _FAQScreenState createState() => _FAQScreenState();
}

class _FAQScreenState extends State<FAQScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FAQ"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 60.0,
          left: 20,
          right: 20,
        ),
        child: Text(
          "Is this applicable for more than 10 fields? \n\nYes it is , its depends on your requirements.\n\nIf you want implementation on larger field just leave us a message.\n\n\nCan you please give me an estimate of the budget required to implement this in my farm? \n\nWe'll give you personalised budget estimate. \nPlease, leave us an email with details.",
          style: TextStyle(
            fontSize: 17,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
