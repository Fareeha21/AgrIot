import 'package:flutter/material.dart';

import 'motorScreen.dart';
import 'reportsScreen.dart';
import 'utils/constants.dart';
import 'widgets/customCard.dart';

class PlantCategoryScreen extends StatefulWidget {
  static const String routeName = "/plantCategoryScreen";
  @override
  _PlantCategoryScreenState createState() => _PlantCategoryScreenState();
}

class _PlantCategoryScreenState extends State<PlantCategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  ReportsScreen.routeName,
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
                onPressed: () {},
              ),
            ),
            CustomCard(
              title: "Plant 3",
              iconSource: Constants.IMAGE_LOGO,
              width: 120,
              onPressed: () {
                Navigator.of(context).pushNamed(
                  MotorScreen.routeName,
                );
              },
            ),
            CustomCard(
              title: "Plant 4",
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
