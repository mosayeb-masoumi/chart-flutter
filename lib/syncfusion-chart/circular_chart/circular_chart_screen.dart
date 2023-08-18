import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CircularChartScreen extends StatefulWidget {
  const CircularChartScreen({super.key});

  @override
  State<CircularChartScreen> createState() => _CircularChartScreenState();
}

class _CircularChartScreenState extends State<CircularChartScreen> {
  late List<GDPData> _chartData;
  late TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    _chartData = getChartData();
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SfCircularChart(
          title: ChartTitle(text: 'Continent with GDP'),
          legend: const Legend(
              position: LegendPosition.bottom,
              borderColor: Colors.red,
              borderWidth: 1,
              iconHeight: 20,
              iconWidth: 20,
              isVisible: true,
              overflowMode: LegendItemOverflowMode.wrap,
              textStyle: TextStyle(color: Colors.black, fontSize: 20)),

          tooltipBehavior: _tooltipBehavior,
          series: <CircularSeries>[
            PieSeries<GDPData, String>(
                dataSource: _chartData,
                xValueMapper: (GDPData data, _) => data.content,
                yValueMapper: (GDPData data, _) => data.gdp,
                dataLabelSettings: const DataLabelSettings(isVisible: true),
                enableTooltip: true
            ),

          ],
        ),
      ),

      // body: Center(
      //     child: SfCircularChart(
      //   title: ChartTitle(text: 'Sales by sales person'),
      //   legend: Legend(isVisible: true),
      //     series: <PieSeries<_PieData, String>>[
      //       PieSeries<_PieData, String>(
      //           explode: true,
      //           explodeIndex: 0,
      //           dataSource: pieData,
      //           xValueMapper: (_PieData data, _) => data.xData,
      //           yValueMapper: (_PieData data, _) => data.yData,
      //           dataLabelMapper: (_PieData data, _) => data.text,
      //           dataLabelSettings: DataLabelSettings(isVisible: true)),
      //     ]
      // )
      // ),
    );
  }

  List<GDPData> getChartData() {
    final List<GDPData> chartData = [
      GDPData("Oceania", 1600),
      GDPData("Africa", 2490),
      GDPData("S America", 2900),
      GDPData("Europe", 23050),
      GDPData("N America", 24880),
      GDPData("Asia", 34390),
    ];
    return chartData;
  }
}

class GDPData {
  final String content;
  final int gdp;

  GDPData(this.content, this.gdp);
}
