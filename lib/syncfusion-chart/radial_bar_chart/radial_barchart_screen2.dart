import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class RadialBarChartScreen2 extends StatefulWidget {
  const RadialBarChartScreen2({Key? key}) : super(key: key);

  @override
  State<RadialBarChartScreen2> createState() => _RadialBarChartScreen2State();
}

// https://help.syncfusion.com/flutter/circular-charts/chart-types/radial-bar-chart

class _RadialBarChartScreen2State extends State<RadialBarChartScreen2> {

  late List<ChartData> chartData;
  late List<ChartDataColor> chartDataColor;
  late TooltipBehavior _tooltip;

  @override
  void initState() {
    chartData = [
      ChartData('David', 25),
      ChartData('Steve', 38),
      ChartData('Jack', 34),
      ChartData('Others', 75)
    ];


    chartDataColor = [
      ChartDataColor(1924, 90, '100%', Colors.blue),
      ChartDataColor(1925, 50, '100%', Colors.green),
      ChartDataColor(1926, 70, '100%', Colors.red),
    ];

    _tooltip = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Radial Bar Chart"), centerTitle: true),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                child: SfCircularChart(

                    tooltipBehavior: _tooltip,
                    legend: Legend(isVisible: true),

                    series: <CircularSeries>[
                      // Renders radial bar chart
                      RadialBarSeries<ChartData, String>(
                          dataSource: chartData,
                          xValueMapper: (ChartData data, _) => data.x,
                          yValueMapper: (ChartData data, _) => data.y,

                          maximumValue: 100,

                          // Radius of the radial bar
                          // radius: '80%',

                          // Radius of the radial bar's inner circle
                          innerRadius: '60%',

                          // Corner style of radial bar segment
                          cornerStyle: CornerStyle.bothCurve
                      )
                    ]
                )
            ),


            Container(
                child: SfCircularChart(

                    tooltipBehavior: _tooltip,

                    series:  <RadialBarSeries<ChartDataColor, int>>[
                      RadialBarSeries<ChartDataColor, int>(
                          useSeriesColor: true,
                          trackOpacity: 0.3,
                          cornerStyle: CornerStyle.bothCurve,
                          dataSource: chartDataColor,
                          pointRadiusMapper: (ChartDataColor data, _) => data.text,
                          pointColorMapper: (ChartDataColor data, _) => data.color,
                          xValueMapper: (ChartDataColor data, _) => data.x,
                          yValueMapper: (ChartDataColor data, _) => data.y,

                          dataLabelSettings: DataLabelSettings(
                            // Renders the data label
                              isVisible: true
                          )

                      )
                    ]
                )
            )




          ],
        ),
      ),
    );
  }
}


class ChartData {
  ChartData(this.x, this.y);
  final String x;
  final double y;
}


class ChartDataColor {
  ChartDataColor(this.x, this.y , this.text , this.color);
  final int x;
  final double y;
  final String text;
  final Color color;
}