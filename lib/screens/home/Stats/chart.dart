import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyChart extends StatefulWidget {
  const MyChart({super.key});

  @override
  State<MyChart> createState() => _MyChartState();
}

class _MyChartState extends State<MyChart> {
  @override
  Widget build(BuildContext context) {
    return BarChart(
      mainBarChart(),
    );
  }

  BarChartData mainBarChart() {
    return BarChartData(
      titlesData: FlTitlesData(
        show: true,
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 38,
            getTitlesWidget: getBottomTitles,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 38,
            getTitlesWidget: getLeftTitles,
          ),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      gridData: const FlGridData(
        show: false,
      ),
      barGroups: getBarGroups(),
    );
  }

  Widget getBottomTitles(double value, TitleMeta meta) {
    Widget text;
    const textstyle = TextStyle(
      color: Colors.grey,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    switch (value.toInt()) {
      case 0:
        text = const Text('01', style: textstyle);
        break;
      case 1:
        text = const Text('02', style: textstyle);
        break;
      case 2:
        text = const Text('03', style: textstyle);
        break;
      case 3:
        text = const Text('04', style: textstyle);
        break;
      case 4:
        text = const Text('05', style: textstyle);
        break;
      case 5:
        text = const Text('06', style: textstyle);
        break;
      case 6:
        text = const Text('07', style: textstyle);
        break;
      case 7:
        text = const Text('08', style: textstyle);
        break;

      default:
        text = const Text('', style: textstyle);
        break;
    }
    return SideTitleWidget(axisSide: meta.axisSide, child: text);
  }

  Widget getLeftTitles(double value, TitleMeta meta) {
    String text;
    const textstyle = TextStyle(
      color: Colors.grey,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    if (value == 0) {
      text = '0K ₹';
    } else if (value == 1) {
      text = '1K ₹';
    } else if (value == 2) {
      text = '2K ₹';
    } else if (value == 3) {
      text = '3K ₹';
    } else if (value == 4) {
      text = '4K ₹';
    } else if(value == 5){
      text = '5K ₹';
    }

      else{
      return Container();
    }



    return SideTitleWidget(
        axisSide: meta.axisSide, child: Text(text, style: textstyle));
  }

  List<BarChartGroupData> getBarGroups() => List.generate(8, (index) {
        switch (index) {
          case 0:
            return makeGroupData(0, 2);
          case 1:
            return makeGroupData(1, 3);
          case 2:
            return makeGroupData(2, 2);
          case 3:
            return makeGroupData(3, 5);
          case 4:
            return makeGroupData(4, 2);
          case 5:
            return makeGroupData(5, 1);
          case 6:
            return makeGroupData(6, 4.5);
          case 7:
            return makeGroupData(7, 3.5);
          default:
            return throw Error();
        }
      });

  BarChartGroupData makeGroupData(int x, double y1) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: y1,
          gradient: const LinearGradient(
            colors: [
              Color(0xff00B2E7),
              Color(0xffE064F7),
              Color(0xffff8d6c),
            ],
            transform: GradientRotation( pi / 40),
          ),
          width: 12,
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            toY: 5,
            color: Colors.grey.shade300,
          ),
        ),
      ],
    );
  }
}
