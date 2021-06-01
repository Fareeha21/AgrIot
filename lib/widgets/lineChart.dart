import 'package:agriot/utils/constants.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'lineTitles.dart';

class LineChartWidget extends StatefulWidget {
  @override
  _LineChartWidgetState createState() => _LineChartWidgetState();
}

class _LineChartWidgetState extends State<LineChartWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) => LineChart(
        LineChartData(
          backgroundColor: Colors.transparent,
          minX: 0,
          maxX: 22,
          minY: 0,
          maxY: 3000,
          titlesData: LineTitles.getTitleData(),
          gridData: FlGridData(
            show: false,
            // getDrawingHorizontalLine: (value) {
            //   return FlLine(
            //     color: const Color(0xff37434d),
            //     strokeWidth: 1,
            //   );
            // },
            drawHorizontalLine: false,
            drawVerticalLine: false,
            // getDrawingVerticalLine: (value) {
            //   return FlLine(
            //     color: const Color(0xff37434d),
            //     strokeWidth: 1,
            //   );
            // },
          ),
          borderData: FlBorderData(
            show: true,
            // border: Border.all(color: Theme.of(context).primaryColor, width: 1),
            border: Border(
              bottom: BorderSide(
                color: Constants.COLOR_TEXT_SECONDARY,
                width: 1,
              ),
            ),
          ),
          lineBarsData: [
            LineChartBarData(
              spots: [
                FlSpot(1, 3),
                FlSpot(2.6, 200),
                FlSpot(3, 1600),
                FlSpot(3.4, 1000),
                FlSpot(4, 70),
                FlSpot(5, 100),
                FlSpot(6.8, 1900),
                FlSpot(8, 1000),
                FlSpot(9.5, 900),
                FlSpot(11, 1500),
                FlSpot(12, 400),
                FlSpot(13, 900),
                FlSpot(14, 700),
                FlSpot(15, 1000),
                FlSpot(16, 2200),
                FlSpot(17, 1700),
                FlSpot(19, 2000),
                FlSpot(19, 700),
                FlSpot(20, 20),
                FlSpot(21, 2000),
              ],
              // gradientFrom: Offset(
              //   90.0,
              //   0.0,
              // ),
              isCurved: false,

              colors: [
                Theme.of(context).primaryColor,
                // Colors.white,
              ],
              // barWidth: 5,
              // isStrokeCapRound: true,

              // dotData: FlDotData(show: false),
              belowBarData: BarAreaData(
                show: true,
                colors: [
                  Theme.of(context).accentColor,
                  Colors.white,
                ].map((color) => color.withOpacity(0.3)).toList(),
              ),
            ),
          ],
        ),
      );
}
