import 'package:agriot/utils/constants.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineTitles {
  static getTitleData() => FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 20,
          getTextStyles: (value) => const TextStyle(
            color: Constants.COLOR_TEXT_SECONDARY,
            fontWeight: FontWeight.bold,
            fontSize: 13,
          ),
          getTitles: (value) {
            // margin: 10,
            switch (value.toInt()) {
              case 1:
                return 'Jan';
              case 3:
                return 'Feb';
              case 5:
                return 'Mar';
              case 7:
                return 'Apr';
              case 9:
                return 'May';
              case 11:
                return 'June';
              case 13:
                return 'July';
              case 15:
                return 'Aug';
              case 15:
                return 'Sep';
              case 17:
                return 'Oct';
              case 19:
                return 'Nov';
              case 21:
                return 'Dec';
            }
            return '';
          },
        ),
        leftTitles: SideTitles(
          showTitles: false,
          getTextStyles: (value) => const TextStyle(
            color: Constants.COLOR_TEXT_SECONDARY,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
          getTitles: (value) {
            // switch (value.toInt()) {
            //   case 1:
            //     return '10k';
            //   case 3:
            //     return '30k';
            //   case 5:
            //     return '50k';
            // }
            return '';
          },
          reservedSize: 35,
          margin: 12,
        ),
      );
}
