
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class BarChartPage extends StatefulWidget {
  const BarChartPage({Key? key}) : super(key: key);

  @override
  State<BarChartPage> createState() => _BarChartPageState();
}

//https://help.syncfusion.com/flutter/cartesian-charts/chart-types/bar-chart

class _BarChartPageState extends State<BarChartPage> {

  late List<_ChartData> data;
  late TooltipBehavior _tooltip;

  @override
  void initState() {
    data = [
      _ChartData('CHN', 12),
      _ChartData('GER', 15),
      _ChartData('RUS', 30),
      _ChartData('BRZ', 6.4),
      _ChartData('IND', 14)
    ];
    _tooltip = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Bar chart"), centerTitle: true),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SfCartesianChart(
                primaryXAxis: CategoryAxis(),
                // primaryXAxis: LogarithmicAxis(),

                primaryYAxis: NumericAxis(minimum: 0, maximum: 40, interval: 10),
                tooltipBehavior: _tooltip,
                series: <ChartSeries<_ChartData, String>>[
                  BarSeries<_ChartData, String>(

                      dataSource: data,
                      xValueMapper: (_ChartData data, _) => data.x,
                      yValueMapper: (_ChartData data, _) => data.y,
                      name: 'Gold',
                      color: Color.fromRGBO(8, 142, 255, 1))
                ]),



            
          ],
        ),
      ));
  }
}


class _ChartData {
  _ChartData(this.x, this.y);

  final String x;
  final double y;
}
