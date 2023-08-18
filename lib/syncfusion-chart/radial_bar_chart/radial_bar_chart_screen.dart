
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class RadialBarChartScreen extends StatefulWidget {
  const RadialBarChartScreen({super.key});

  @override
  State<RadialBarChartScreen> createState() => _RadialBarChartScreenState();
}

class _RadialBarChartScreenState extends State<RadialBarChartScreen> {
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
            RadialBarSeries<GDPData, String>(
                dataSource: _chartData,
                xValueMapper: (GDPData data, _) => data.content,
                yValueMapper: (GDPData data, _) => data.gdp,
                dataLabelSettings: const DataLabelSettings(isVisible: true),
                enableTooltip: true,
                maximumValue: 40000
            ),

          ],
        ),
      ),

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
