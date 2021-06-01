import 'package:agriot/widgets/drawerIcon.dart';
import 'package:agriot/widgets/drawerWidget.dart';
import 'package:flutter/material.dart';

import 'widgets/lineChart.dart';

class ReportsScreen extends StatefulWidget {
  static const String routeName = "/reportsScreen";
  @override
  _ReportsScreenState createState() => _ReportsScreenState();
}

class _ReportsScreenState extends State<ReportsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Reports"),
        leading: DrawerIcon(),
      ),
      drawer: DrawerWidget(),
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.15,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                  // color: Colors.grey,
                  width: MediaQuery.of(context).size.width * 2,
                  child: LineChartWidget(),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                top: 120,
              ),
              child: Text(
                  "Under the following conditions;\n\nPlant A that is tomatoe - 95% healthy\n\nPlant B that is spinach - 78% healthy\n\nPlant C that is Marigold Flower - 50% unhealthy"),
              alignment: Alignment.center,
              width: double.infinity,
            ),
          ],
        ),
      ),
    );
  }
}
