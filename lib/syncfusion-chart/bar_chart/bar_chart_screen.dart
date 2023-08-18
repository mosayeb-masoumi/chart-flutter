
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
class BarChartSyncFusionScreen extends StatefulWidget {
  const BarChartSyncFusionScreen({super.key});

  @override
  State<BarChartSyncFusionScreen> createState() => _BarChartSyncFusionScreenState();
}

class _BarChartSyncFusionScreenState extends State<BarChartSyncFusionScreen> {

  final List<ChartData> chartData =[
   ChartData("India", 20, 30, 40, 50),
   ChartData("UK", 40, 20, 10, 16),
   ChartData("China", 40, 20, 10, 22),
   ChartData("USA", 10, 14, 22, 44),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title: const Text("Bar Chart") ,),

      body: Center(
        child: Container(
          child: SfCartesianChart(
            primaryXAxis: CategoryAxis(),

            // to show just y1
            // series: [
            //   StackedColumnSeries(
            //       dataSource: chartData,
            //       xValueMapper: (ChartData ch ,_) => ch.x,
            //       yValueMapper: (ChartData ch ,_) => ch.y1,
            //   )
            // ],

            series: <ChartSeries>[
              StackedColumnSeries<ChartData , String>(
                  dataSource: chartData,
                  xValueMapper: (ChartData ch ,_) => ch.x,
                  yValueMapper: (ChartData ch ,_) => ch.y1,
              ),

              StackedColumnSeries<ChartData , String>(
                dataSource: chartData,
                xValueMapper: (ChartData ch ,_) => ch.x,
                yValueMapper: (ChartData ch ,_) => ch.y2,
              ),

              StackedColumnSeries<ChartData , String>(
                dataSource: chartData,
                xValueMapper: (ChartData ch ,_) => ch.x,
                yValueMapper: (ChartData ch ,_) => ch.y3,
              ),

              StackedColumnSeries<ChartData , String>(
                dataSource: chartData,
                xValueMapper: (ChartData ch ,_) => ch.x,
                yValueMapper: (ChartData ch ,_) => ch.y4,
              ),

            ],

          ),
        ),
      ),
    );
  }
}


class ChartData{
  final String x;
  final int y1;
  final int y2;
  final int y3;
  final int y4;

  ChartData(this.x, this.y1, this.y2, this.y3, this.y4);


}
