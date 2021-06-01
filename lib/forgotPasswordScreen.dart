
import 'package:agriot/widgets/customButton.dart';
import 'package:flutter/material.dart';

import 'changePasswordScreen.dart';
import 'checkEmailScreen.dart';
import 'utils/constants.dart';
import 'widgets/customTextField.dart';

class ForgotPasswordScreen extends StatefulWidget {
  static const String routeName = "/forgotPasswordScreen";
  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  double mediaHeight;
  double mediaWidth;

  TextEditingController controllerEmail = TextEditingController();

  @override
  Widget build(BuildContext context) {
    mediaHeight ??= MediaQuery.of(context).size.height;
    mediaWidth ??= MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 13,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: mediaHeight * 0.12,
                bottom: mediaHeight * 0.015,
              ),
              child: Text(
                'Forgot Password',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
                // textAlign: TextAlign.start,
              ),
            ),
            Text(
              "Enter the email associated with your account and we'll send an email to reset the password.",
              style: TextStyle(
                color: Constants.COLOR_TEXT_SECONDARY,
                fontSize: 14,
                // fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: mediaHeight * 0.05,
                bottom: mediaHeight * 0.03,
              ),
              child: CustomTextField(
                label: "Email",
                controller: controllerEmail,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomButton(
                text: 'Continue',
                onPressed: () {
               Navigator.of(context).pushNamed(
                  ChangePasswordScreen.routeName,
                );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
