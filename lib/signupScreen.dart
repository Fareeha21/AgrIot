import 'package:agriot/dashboardScreen.dart';
import 'package:agriot/providers/authProvider.dart';
import 'package:agriot/utils/constants.dart';
import 'package:agriot/widgets/customButton.dart';
import 'package:agriot/widgets/customTextField.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'loginScreen.dart';

class SignupScreen extends StatefulWidget {
  static const String routeName = "/signupScreen";
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController controllerFirstName = TextEditingController();
  TextEditingController controllerLastName = TextEditingController();

  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPass = TextEditingController();
  TextEditingController controllerRePass = TextEditingController();

  AuthProvider authProvider;

  bool isAgreed = false;
  @override
  Widget build(BuildContext context) {
    authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign up"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 40.0,
                  bottom: 35,
                ),
                child: CircleAvatar(
                  radius: 60,
                  backgroundColor: Theme.of(context).primaryColor,
                  child: CircleAvatar(
                    radius: 58,
                    backgroundImage: AssetImage(
                      Constants.IMAGE_LOGO,
                    ),
                    backgroundColor: Colors.white,
                  ),
                ),
              ),
              // Text(
              //   "Welcome to Agriot",
              //   style: TextStyle(
              //     fontSize: 30,
              //     // fontWeight: FontWeight.bold,
              //   ),
              // ),
              // SizedBox(height: 50,),
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      icon: Icons.person,
                      label: "First Name",
                      controller: controllerFirstName,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: CustomTextField(
                      icon: Icons.person,
                      label: "Last Name",
                      controller: controllerLastName,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              CustomTextField(
                // hint: "Enter email address",
                label: "Email",
                icon: Icons.email,
                controller: controllerEmail,
              ),
              SizedBox(
                height: 20,
              ),
              CustomTextField(
                label: "Password",
                // hint: "Enter password",
                obscureText: true,
                icon: Icons.lock,
                controller: controllerPass,
              ),
              SizedBox(
                height: 20,
              ),
              CustomTextField(
                label: "Cofirm Password",
                // hint: "Enter password",
                obscureText: true,
                icon: Icons.lock,
                controller: controllerRePass,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 15.0,
                  bottom: 50,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Checkbox(
                              value: isAgreed,
                              onChanged: (val) {
                                setState(() {
                                  isAgreed = val;
                                });
                              }),
                          Text(
                            "I agree with All Terms & Conditions",
                            style: TextStyle(
                              // color: Colors.grey,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              CustomButton(
                onPressed: isAgreed
                    ? () async {
                        if (controllerEmail.text.isEmpty ||
                            controllerPass.text.isEmpty ||
                            controllerFirstName.text.isEmpty ||
                            controllerLastName.text.isEmpty) {
                          print("EMPTY");
                          return;
                        }

                        if (controllerPass.text != controllerRePass.text) {
                          return;
                        }
                        if (await authProvider.signUpWithEmail(
                          // context,
                          controllerEmail.text,
                          controllerPass.text,
                          controllerFirstName.text,
                          controllerLastName.text,
                        )) {
                          Navigator.of(context).pushNamed(
                            DashboardScreen.routeName,
                          );
                        }
                      }
                    : null,
                text: "Register",
              ),
              SizedBox(
                height: 20,
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Already have an account?  ",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    TextSpan(
                      text: "Sign in",
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.of(context).pushNamed(
                            LoginScreen.routeName,
                          );
                        },
                      style: TextStyle(
                        fontSize: 16,
                        color: Theme.of(context).primaryColor,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    controllerEmail.dispose();

    super.dispose();
  }
}
