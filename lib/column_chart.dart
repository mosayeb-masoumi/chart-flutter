
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ColumnChartPage extends StatefulWidget {
  const ColumnChartPage({Key? key}) : super(key: key);

  @override
  State<ColumnChartPage> createState() => _ColumnChartPageState();
}

// https://help.syncfusion.com/flutter/cartesian-charts/chart-types/column-chart

class _ColumnChartPageState extends State<ColumnChartPage> {


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
        appBar: AppBar(title: Text("Column chart"), centerTitle: true),
      body: SfCartesianChart(
          palette: [Colors.red , Colors.blue , Colors.green , Colors.yellow , Colors.white10],
          primaryXAxis: CategoryAxis(),
          primaryYAxis: NumericAxis(minimum: 0, maximum: 40, interval: 5),
          backgroundColor: Colors.white,
          enableAxisAnimation: true,

          legend: Legend(isVisible: true),
          borderWidth: 0,
          


          tooltipBehavior: _tooltip,
          series: <ChartSeries<_ChartData, String>>[
            ColumnSeries<_ChartData, String>(
                dataSource: data,
                xValueMapper: (_ChartData data, _) => data.x,
                yValueMapper: (_ChartData data, _) => data.y,
                name: 'Gold',
                color: Colors.green
            )
          ]));

  }
}

class _ChartData {
  _ChartData(this.x, this.y);

  final String x;
  final double y;
}
