import 'package:agriot/motorScreen.dart';
import 'package:agriot/reportsScreen.dart';
import 'package:agriot/utils/constants.dart';
import 'package:agriot/widgets/customCard.dart';
import 'package:agriot/widgets/drawerIcon.dart';
import 'package:agriot/widgets/drawerWidget.dart';
import 'package:flutter/material.dart';
import './sensorsScreen.dart';

class HomepageScreen extends StatefulWidget {
  static const String routeName = "/homepageScreen";
  @override
  _HomepageScreenState createState() => _HomepageScreenState();
}

class _HomepageScreenState extends State<HomepageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(),
      appBar: AppBar(
        leading: DrawerIcon(),
        title: Text("Home"),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomCard(
              title: "REPORTS",
              iconSource: Constants.IMAGE_LOGO,
              onPressed: () {
                Navigator.of(context).pushNamed(
                  ReportsScreen.routeName,
                );
              },
              width: 120,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 25.0),
              child: CustomCard(
                  title: "SENSOR_DATA",
                  iconSource: Constants.IMAGE_LOGO,
                  width: 120,
                  onPressed: () {
                    Navigator.of(context).pushNamed(SensorsScreen.routeName);
                  }),
            ),
            CustomCard(
              title: "MOTOR",
              iconSource: Constants.IMAGE_LOGO,
              width: 120,
              onPressed: () {
                Navigator.of(context).pushNamed(
                  MotorScreen.routeName,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
