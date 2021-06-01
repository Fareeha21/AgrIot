import 'package:agriot/singleSensorScreen.dart';
import 'package:flutter/material.dart';

import 'utils/constants.dart';
import 'widgets/customCard.dart';

class SensorsScreen extends StatefulWidget {
  static const String routeName = "/sensorsScreen";
  @override
  _SensorsScreenState createState() => _SensorsScreenState();
}

class _SensorsScreenState extends State<SensorsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sensors"),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomCard(
              title: "Plant 1",
              iconSource: Constants.IMAGE_LOGO,
              onPressed: () {
                Navigator.of(context).pushNamed(
                  SingleSensorScreen.routeName,
                );
              },
              width: 120,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 25.0),
              child: CustomCard(
                title: "Plant 2",
                iconSource: Constants.IMAGE_LOGO,
                width: 120,
                onPressed: () {
                  Navigator.of(context).pushNamed(
                    SingleSensorScreen.routeName,
                  );
                },
              ),
            ),
            CustomCard(
              title: "Plant 3",
              iconSource: Constants.IMAGE_LOGO,
              width: 120,
              onPressed: () {
                Navigator.of(context).pushNamed(
                  SingleSensorScreen.routeName,
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 25.0),
              child: CustomCard(
                title: "Plant 4",
                iconSource: Constants.IMAGE_LOGO,
                width: 120,
                onPressed: () {
                  Navigator.of(context).pushNamed(
                    SingleSensorScreen.routeName,
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
