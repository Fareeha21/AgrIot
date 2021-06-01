import 'package:agriot/FAQ.dart';
import 'package:agriot/changePasswordScreen.dart';
import 'package:agriot/checkEmailScreen.dart';
import 'package:agriot/contactUsScreen.dart';
import 'package:agriot/dashboardScreen.dart';
import 'package:agriot/forgotPasswordScreen.dart';
import 'package:agriot/homepageScreen.dart';
import 'package:agriot/loginScreen.dart';
import 'package:agriot/motorScreen.dart';
import 'package:agriot/plantCategoryScreen.dart';
import 'package:agriot/providers/authProvider.dart';
import 'package:agriot/reportsScreen.dart';
import 'package:agriot/sensorsScreen.dart';
import 'package:agriot/signupScreen.dart';
import 'package:agriot/utils/constants.dart';
import 'package:agriot/widgets/PrivacyPolicyScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './singleSensorScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<FirebaseApp>(
        future: Firebase.initializeApp(),
        builder: (ctx, snapshot) {
          if (!snapshot.hasData) {
            print("NOT HAS DATA");
            // return HomepageScreen();
            // return MotorScreen();
            return Container(
              color: Colors.white,
              height: double.infinity,
              width: double.infinity,
              child: Center(
                child: Image.asset(
                  Constants.IMAGE_LOGO,
                  // fit: BoxFit.cover,
                  height: double.infinity,
                ),
              ),
            );
          }

          if (snapshot.hasError) {
            print("ERROR IN FIREBASE INIT. ERROR = " + snapshot.error);
          }

          return MultiProvider(
            providers: [
              ChangeNotifierProvider.value(
                value: AuthProvider(),
              ),
            ],
            child: Consumer<AuthProvider>(
              builder: (ctx, auth, child) {
                return MaterialApp(
                  home: auth.isLoggedIn ? DashboardScreen() : LoginScreen(),
                  theme: ThemeData(
                    primaryColor: Color(0xff2e856e),
                    accentColor: Colors.greenAccent,
                    appBarTheme: AppBarTheme(
                      centerTitle: true,
                    ),
                  ),
                  debugShowCheckedModeBanner: false,
                  routes: {
                    LoginScreen.routeName: (ctx) => LoginScreen(),
                    SignupScreen.routeName: (ctx) => SignupScreen(),
                    ForgotPasswordScreen.routeName: (ctx) =>
                        ForgotPasswordScreen(),
                    CheckEmailScreen.routeName: (ctx) => CheckEmailScreen(),
                    ChangePasswordScreen.routeName: (ctx) =>
                        ChangePasswordScreen(),
                    DashboardScreen.routeName: (ctx) => DashboardScreen(),
                    HomepageScreen.routeName: (ctx) => HomepageScreen(),
                    ReportsScreen.routeName: (ctx) => ReportsScreen(),
                    MotorScreen.routeName: (ctx) => MotorScreen(),
                    SensorsScreen.routeName: (ctx) => SensorsScreen(),
                    PlantCategoryScreen.routeName: (ctx) =>
                        PlantCategoryScreen(),
                    SingleSensorScreen.routeName: (ctx) => SingleSensorScreen(),
                    PrivacyPolicyScreen.routeName: (ctx) =>
                        PrivacyPolicyScreen(),
                    FAQScreen.routeName: (ctx) => FAQScreen(),
                    ContactUsScreen.routeName: (ctx) => ContactUsScreen(),
                    // SensorsScreen.routeName: (ctx) => SensorsScreen(),
                  },
                );
              },
            ),
          );
        });
  }
}
