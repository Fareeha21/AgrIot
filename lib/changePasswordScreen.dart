
import 'package:agriot/loginScreen.dart';
import 'package:agriot/utils/constants.dart';
import 'package:agriot/widgets/customButton.dart';
import 'package:flutter/material.dart';

import 'widgets/customTextField.dart';

class ChangePasswordScreen extends StatefulWidget {
  static const String routeName = "/changePasswordScreen";
  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  double mediaHeight;
  double mediaWidth;

  TextEditingController controllerPass = TextEditingController();
  TextEditingController controllerConfirmPass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    mediaHeight ??= MediaQuery.of(context).size.height;
    mediaWidth ??= MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: mediaWidth * 0.04,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: mediaHeight * 0.12,
                  bottom: mediaHeight * 0.015,
                ),
                child: Text(
                  'Create New Password',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                  // textAlign: TextAlign.start,
                ),
              ),
              Text(
                "Your new password must be different from any of the previously used passwords.",
                style: TextStyle(
                  color: Constants.COLOR_TEXT_SECONDARY,
                  fontSize: 14,
                  // fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: mediaHeight * 0.06,
                  bottom: mediaHeight * 0.02,
                ),
                child: CustomTextField(
                  label: "New Password",
                  controller: controllerPass,
                  obscureText: true,
                ),
              ),
              CustomTextField(
                label: "Confirm Password",
                obscureText: true,
                controller: controllerConfirmPass,
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: mediaHeight * 0.05,
                ),
                child: CustomButton(
                  text: 'Reset Password',
                  onPressed: () {
                    Navigator.of(context).pushNamed(
                      LoginScreen.routeName,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
