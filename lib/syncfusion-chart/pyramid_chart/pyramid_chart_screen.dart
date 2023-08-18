import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class PyramidChartScreen extends StatefulWidget {
  const PyramidChartScreen({Key? key}) : super(key: key);

  @override
  State<PyramidChartScreen> createState() => _PyramidChartScreenState();
}

class _PyramidChartScreenState extends State<PyramidChartScreen> {

  late TooltipBehavior _tooltipBehavior;

  @override
  void initState(){
    _tooltipBehavior =  TooltipBehavior(enable: true);
    super.initState();
  }

  // https://help.syncfusion.com/flutter/pyramid-chart/getting-started

  @override
  Widget build(BuildContext context) {

    final List<ChartData> chartData = [
      // ChartData('David', 25 , Colors.red),
      // ChartData('Steve', 38, Colors.blue),
      // ChartData('Jack', 34, Colors.green),
      // ChartData('Others', 52, Colors.yellow)

      ChartData('David', 25 ,),
      ChartData('Steve', 38, ),
      ChartData('Jack', 34, ),
      ChartData('Others', 52,)
    ];

    return Scaffold(
        appBar: AppBar(title: Text("Pyramid chart"), centerTitle: true),
        body: Center(
            child: Container(
                child: SfPyramidChart(

                  // Enables the tooltip for all the series in chart
                    tooltipBehavior: _tooltipBehavior,

                    palette: [Colors.red , Colors.blue , Colors.green , Colors.yellow ,],

                    // Enables the legend
                    legend: Legend(isVisible: true),
                    // Initialize category axis
                    // primaryXAxis: CategoryAxis(),


                    series: PyramidSeries<ChartData, String>(
                      dataSource: chartData,
                      xValueMapper: (ChartData data, _) => data.x,
                      yValueMapper: (ChartData data, _) => data.y ,
                      dataLabelSettings:DataLabelSettings(isVisible : true),

                    )))));
  }

}

class ChartData {
  // ChartData(this.x, this.y, this.color);
  ChartData(this.x, this.y);

  final String x;
  final double y;
// final Color color;
}