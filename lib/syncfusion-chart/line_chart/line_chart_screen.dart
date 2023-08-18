import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';

class LineChartSyncfusionScreen extends StatefulWidget {
  const LineChartSyncfusionScreen({super.key});

  @override
  State<LineChartSyncfusionScreen> createState() =>
      _LineChartSyncfusionScreenState();
}

class _LineChartSyncfusionScreenState extends State<LineChartSyncfusionScreen> {
  late List<SalesData> _chartData;
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
      appBar: AppBar(
        title: Text("Line chart syncfusion"),
      ),
      body: Center(
        child: SfCartesianChart(
          title: ChartTitle(text: "Yearly sales analysis"),
          legend: const Legend(
              isVisible: true,
              borderColor: Colors.red,
              borderWidth: 1,
              iconHeight: 20,
              iconWidth: 20,
              alignment: ChartAlignment.center,
              position: LegendPosition.bottom,
              textStyle: TextStyle(color: Colors.black, fontSize: 20)),
          tooltipBehavior: _tooltipBehavior,
          series: <ChartSeries>[
            LineSeries<SalesData, double>(
              name: "Saless",
              dataSource: _chartData,
              xValueMapper: (SalesData sales, _) => sales.year,
              yValueMapper: (SalesData sales, _) => sales.sales,
              dataLabelSettings: const DataLabelSettings(isVisible: true, angle: 0),
              enableTooltip: true,
            ),
          ],
          primaryXAxis:
              NumericAxis(edgeLabelPlacement: EdgeLabelPlacement.shift),
          primaryYAxis: NumericAxis(
              labelFormat: "{value}M", // to add M in y column
              numberFormat: NumberFormat.simpleCurrency(decimalDigits: 0)),
        ),
      ),
    );
  }

  List<SalesData> getChartData() {
    final List<SalesData> list = [
      SalesData(2017, 25),
      SalesData(2018, 12),
      SalesData(2019, 24),
      SalesData(2020, 18),
      SalesData(2021, 30),
    ];
    return list;
  }
}

class SalesData {
  final double year;
  final double sales;

  SalesData(this.year, this.sales);
}
