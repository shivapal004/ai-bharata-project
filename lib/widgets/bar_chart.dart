import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

void main() => runApp(const BarChartSample());

class BarChartSample extends StatelessWidget {
  const BarChartSample({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: AspectRatio(
              aspectRatio: 1.7,
              child: BarChart(
                BarChartData(
                  alignment: BarChartAlignment.spaceAround,
                  maxY: 80,
                  barTouchData: BarTouchData(
                    enabled: true,
                  ),
                  titlesData: FlTitlesData(
                    show: true,
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          const style = TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 8,
                          );
                          switch (value.toInt()) {
                            case 0:
                              return Text('>10%', style: style);
                            case 1:
                              return Text('7-10%', style: style);
                            case 2:
                              return Text('5-7%', style: style);
                            case 3:
                              return Text('3-5%', style: style);
                            case 4:
                              return Text('0-3%', style: style);
                            case 5:
                              return Text('0%', style: style);
                            case 6:
                              return Text('3-5%', style: style);
                            case 7:
                              return Text('5-7%', style: style);
                            case 8:
                              return Text('7-10%', style: style);
                            case 9:
                              return Text('>10%', style: style);
                            default:
                              return Text('', style: style);
                          }
                        },
                        reservedSize: 28,
                      ),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    topTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    rightTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                  ),
                  borderData: FlBorderData(
                    show: false,
                  ),
                  gridData: FlGridData(
                    show: false, // Disable grid lines
                  ),
                  barGroups: [
                    BarChartGroupData(
                      x: 0,
                      barRods: [
                        BarChartRodData(
                          toY: 10,
                          color: Colors.green,
                          width: 15,
                        ),
                      ],
                    ),
                    BarChartGroupData(
                      x: 1,
                      barRods: [
                        BarChartRodData(
                          toY: 8,
                          color: Colors.green,
                          width: 15,
                        ),
                      ],
                    ),
                    BarChartGroupData(
                      x: 2,
                      barRods: [
                        BarChartRodData(
                          toY: 8,
                          color: Colors.green,
                          width: 15,
                        ),
                      ],
                    ),
                    BarChartGroupData(
                      x: 3,
                      barRods: [
                        BarChartRodData(
                          toY: 23,
                          color: Colors.green,
                          width: 15,
                        ),
                      ],
                    ),
                    BarChartGroupData(
                      x: 4,
                      barRods: [
                        BarChartRodData(
                          toY: 53,
                          color: Colors.green,
                          width: 15,
                        ),
                      ],
                    ),
                    BarChartGroupData(
                      x: 5,
                      barRods: [
                        BarChartRodData(
                          toY: 80,
                          color: Colors.grey,
                          width: 15,
                        ),
                      ],
                    ),
                    BarChartGroupData(
                      x: 6,
                      barRods: [
                        BarChartRodData(
                          toY: 1,
                          color: Colors.red,
                          width: 15,
                        ),
                      ],
                    ),
                    BarChartGroupData(
                      x: 7,
                      barRods: [
                        BarChartRodData(
                          toY: 2,
                          color: Colors.red,
                          width: 15,
                        ),
                      ],
                    ),
                    BarChartGroupData(
                      x: 8,
                      barRods: [
                        BarChartRodData(
                          toY: 0,
                          color: Colors.red,
                          width: 15,
                        ),
                      ],
                    ),
                    BarChartGroupData(
                      x: 9,
                      barRods: [
                        BarChartRodData(
                          toY: 0,
                          color: Colors.red,
                          width: 15,
                        ),
                      ],
                    ),

                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
