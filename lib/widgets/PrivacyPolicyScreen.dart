import 'package:flutter/material.dart';

class PrivacyPolicyScreen extends StatefulWidget {
  static const String routeName = "/PrivacyPolicyScreen";
  @override
  _PrivacyPolicyScreenState createState() => _PrivacyPolicyScreenState();
}

class _PrivacyPolicyScreenState extends State<PrivacyPolicyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Privacy Policy"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 60.0,
          left: 20,
          right: 20,
        ),
        child: Text(
          "We may use your User Personal Information if it is necessary for security purposes or to investigate possible fraud or attempts to harm Agriot or our Users. We may use your User Personal Information to comply with our legal obligations, protect our intellectual property, and enforce our Terms of Service.",
          style: TextStyle(
            fontSize: 17,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
