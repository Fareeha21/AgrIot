import 'package:agriot/dashboardScreen.dart';
import 'package:agriot/forgotPasswordScreen.dart';
import 'package:agriot/homepageScreen.dart';
import 'package:agriot/providers/authProvider.dart';
import 'package:agriot/signupScreen.dart';
import 'package:agriot/utils/constants.dart';
import 'package:agriot/widgets/customButton.dart';
import 'package:agriot/widgets/customTextField.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = "/loginScreen";
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPass = TextEditingController();

  AuthProvider authProvider;

  bool rememberMe = false;
  @override
  Widget build(BuildContext context) {
    authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      appBar: AppBar(
          // title: Text("Login"),
          // centerTitle: true,
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
                  bottom: 60,
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

              Padding(
                padding: const EdgeInsets.only(
                  top: 15.0,
                  bottom: 60,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Switch(
                              value: rememberMe,
                              onChanged: (val) {
                                setState(() {
                                  rememberMe = val;
                                });
                              }),
                          Text(
                            "Remember Me",
                            style: TextStyle(
                              // color: Colors.grey,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          child: Text(
                            "Forgot password?    ",
                            style: TextStyle(
                              fontSize: 16,
                              // color: Colors.grey,
                            ),
                          ),
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed(ForgotPasswordScreen.routeName);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              CustomButton(
                onPressed: () async {
                  if (controllerEmail.text.isEmpty ||
                      controllerPass.text.isEmpty) {
                    return;
                  }
                  if (await authProvider.signInWithEmail(
                      controllerEmail.text, controllerPass.text, context)) {
                    Navigator.of(context).pushNamed(
                      HomepageScreen.routeName,
                    );
                  }
                },
                text: "Login",
              ),
              SizedBox(
                height: 20,
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Don't have an account?  ",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    TextSpan(
                      text: "Sign Up",
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          print("SIGN UP PRESSED");
                          Navigator.of(context).pushNamed(
                            SignupScreen.routeName,
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
}
