
import 'package:agriot/widgets/customButton.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'changePasswordScreen.dart';
import 'utils/constants.dart';

class CheckEmailScreen extends StatefulWidget {
  static const String routeName = '/checkEmailScreen';
  @override
  _CheckEmailScreenState createState() => _CheckEmailScreenState();
}

class _CheckEmailScreenState extends State<CheckEmailScreen> {
  double mediaHeight;
  double mediaWidth;

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
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: mediaHeight * 0.06,
              ),
              child: Image.asset(
                Constants.ICON_MAIL,
                height: 70,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: mediaHeight * 0.08,
                bottom: mediaHeight * 0.015,
              ),
              child: Text(
                'Check your mail',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
                // textAlign: TextAlign.start,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: mediaWidth * 0.1,
              ),
              child: Text(
                "We have sent a password recovery instructions to your attached email account.",
                style: TextStyle(
                  color: Constants.COLOR_TEXT_SECONDARY,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: mediaHeight * 0.05,
            ),
            CustomButton(
              text: 'Open Email App',
              onPressed: () {
                Navigator.of(context).pushNamed(
                  ChangePasswordScreen.routeName,
                );
              },
            ),
            SizedBox(
              height: mediaHeight * 0.03,
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Haven't received an email? ",
                    style: TextStyle(
                      color: Constants.COLOR_TEXT_SECONDARY,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: "Try again",
                    style: TextStyle(
                      color: Theme.of(context).accentColor,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
