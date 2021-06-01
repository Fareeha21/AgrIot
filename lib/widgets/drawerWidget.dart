import 'package:agriot/FAQ.dart';
import 'package:agriot/contactUsScreen.dart';
import 'package:agriot/dashboardScreen.dart';
import 'package:agriot/loginScreen.dart';
import 'package:agriot/utils/constants.dart';
import 'package:agriot/widgets/PrivacyPolicyScreen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:share/share.dart';
import '../homepageScreen.dart';
import '../providers/authProvider.dart';
import 'package:provider/provider.dart';

class DrawerWidget extends StatefulWidget {
  // AuthProvider authProvider;

  @override
  _DrawerWidgetState createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  AuthProvider authProvider;
  @override
  Widget build(BuildContext context) {
    authProvider = Provider.of<AuthProvider>(context);

    return SafeArea(
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        child: Drawer(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Theme.of(context).primaryColor,
                  Colors.green[400],
                ],
              ),
              border: Border.all(
                color: Theme.of(context).primaryColor,
              ),
            ),
            // color: Colors.white,
            child: Column(
              children: [
                StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection("users")
                        .doc(FirebaseAuth.instance.currentUser.email)
                        .snapshots(),
                    // stream: Stream.empty(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData)
                        return Center(
                          child: CircularProgressIndicator(),
                        );

                      var doc = snapshot.data.data();
                      print("DOCUMENT  = " + doc.toString());
                      return Column(
                        children: <Widget>[
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(
                                width: 20,
                              ),
                              CircleAvatar(
                                radius: 45,
                                backgroundImage: AssetImage(
                                  Constants.IMAGE_LOGO,
                                ),
                                backgroundColor: Colors.white,
                                // backgroundImage: NetworkImage(
                                //   doc["profileUrl"],
                                // ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Column(
                                // mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    doc["firstName"] + " " + doc["lastName"],
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 22,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  SizedBox(
                                    width: 140,
                                    child: FittedBox(
                                      fit: BoxFit.fitWidth,
                                      child: Text(
                                        FirebaseAuth.instance.currentUser.email,

                                        style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white,
                                          // fontSize: 19,
                                        ),

                                        // maxLines: 2,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      );
                    }),

                buildDrawerButton("Home", Icons.home, () {
                  print("DRAWER HOME BUTTON PRESSED");
                  Navigator.of(context).pushNamed(
                    HomepageScreen.routeName,
                  );
                }),
                // buildDrawerButton("Profile", Icons.person_outline, () {
                //   print("DRAWER Profile BUTTON PRESSED");
                //   Navigator.of(context).pushReplacementNamed(
                //     DashboardScreen.routeName,
                //     arguments: true,
                //   );
                // }),

                buildDrawerButton("Privacy Policy", Icons.privacy_tip, () {
                  print("DRAWER Privacy Policy BUTTON PRESSED");
                  Navigator.of(context).pushNamed(
                    PrivacyPolicyScreen.routeName,
                  );
                }),

                buildDrawerButton("Share", Icons.share, () {
                  print("DRAWER Share BUTTON PRESSED");
                  Share.share('check out my website https://example.com',
                      subject: 'Look what I made!');
                }),
                // buildDrawerButton("Account", Icons.person_outline, () {
                //   print("DRAWER Account BUTTON PRESSED");
                // }),
                buildDrawerButton("Help/F.A.Q", Icons.help_outline, () {
                  print("DRAWER Help/F.A.Q BUTTON PRESSED");
                  Navigator.of(context).pushNamed(
                    FAQScreen.routeName,
                  );
                }),
                buildDrawerButton("Contact Us", Icons.phone, () {
                  print("DRAWER Contact Us BUTTON PRESSED");

                  Navigator.of(context).pushNamed(ContactUsScreen.routeName);
                }),
                // Spacer(),
                buildDrawerButton("Log Out", Icons.close, () async {
                  print("DRAWER Log Out BUTTON PRESSED");
                  if (await authProvider.signOut(
                    context,
                  )) {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        LoginScreen.routeName, (route) => false);
                  }
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildDrawerButton(
    String text,
    IconData icon,
    Function onPressed,
  ) {
    return Column(
      children: <Widget>[
        ListTile(
          onTap: onPressed,
          leading: Icon(
            icon,
            color: Colors.white,
          ),
          title: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ),
        Divider(
          color: Colors.black12,
          height: 1,
          thickness: 2,
        ),
      ],
    );
  }
}
