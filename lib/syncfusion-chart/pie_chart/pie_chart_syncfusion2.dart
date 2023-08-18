import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class PieChartSyncfusionScreen2 extends StatefulWidget {
  const PieChartSyncfusionScreen2({Key? key}) : super(key: key);

  @override
  State<PieChartSyncfusionScreen2> createState() => _PieChartSyncfusionScreen2State();
}

class _PieChartSyncfusionScreen2State extends State<PieChartSyncfusionScreen2> {


  //https://help.syncfusion.com/flutter/circular-charts/chart-types/pie-chart

  late List<ChartData> chartData;
  late List<ChartDataSize> chartDataSize;
  late TooltipBehavior _tooltip;

  @override
  void initState() {
    chartData = [
      ChartData('CHN', 12 , Colors.red),
      ChartData('GER', 15, Colors.green),
      ChartData('RUS', 30, Colors.blue),
      ChartData('BRZ', 6.4, Colors.blueGrey),
      ChartData('IND', 14, Colors.yellow)
    ];


    chartDataSize = [
      ChartDataSize('USA', 10, '70%'),
      ChartDataSize('China', 11, '60%'),
      ChartDataSize('Russia', 9, '52%'),
      ChartDataSize('Germany', 10, '40%')
    ];

    _tooltip = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Column chart"), centerTitle: true),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  child: SfCircularChart(
                      tooltipBehavior: _tooltip,
                      legend: Legend(isVisible: true),
                      series: <CircularSeries>[
                        // Render pie chart
                        PieSeries<ChartData, String>(
                          dataSource: chartData,
                          pointColorMapper:(ChartData data, _) => data.color,
                          xValueMapper: (ChartData data, _) => data.x,
                          yValueMapper: (ChartData data, _) => data.y,

                          radius: '80%',
                          explode: true,
                          // First segment will be exploded on initial rendering
                          explodeIndex: 1,
                          // All the segments will be exploded
                          // explodeAll: true
                        )
                      ]
                  )
              ),


              Container(
                  child: SfCircularChart(
                      tooltipBehavior: _tooltip,
                      legend: Legend(isVisible: true),
                      series: <CircularSeries>[
                        // Render pie chart
                        PieSeries<ChartData, String>(
                            dataSource: chartData,
                            pointColorMapper:(ChartData data, _) => data.color,
                            xValueMapper: (ChartData data, _) => data.x,
                            yValueMapper: (ChartData data, _) => data.y,

                            radius: '80%',
                            explode: true,
                            // First segment will be exploded on initial rendering
                            explodeIndex: 1,
                            // All the segments will be exploded
                            // explodeAll: true

                            // starting angle of pie
                            startAngle: 270,
                            // ending angle of pie
                            endAngle: 90

                        )
                      ]
                  )
              ),





              Container(
                  child: SfCircularChart(
                      tooltipBehavior: _tooltip,
                      legend: Legend(isVisible: true),
                      series: <CircularSeries>[
                        // Render pie chart
                        PieSeries<ChartData, String>(
                            dataSource: chartData,
                            pointColorMapper:(ChartData data, _) => data.color,
                            xValueMapper: (ChartData data, _) => data.x,
                            yValueMapper: (ChartData data, _) => data.y,

                            radius: '80%',
                            explode: true,
                            // First segment will be exploded on initial rendering
                            explodeIndex: 1,
                            // All the segments will be exploded
                            // explodeAll: true

                            groupMode: CircularChartGroupMode.point,
                            // As the grouping mode is point, 2 points will be grouped
                            groupTo: 2

                        )
                      ]
                  )
              ),




              Container(
                  child: SfCircularChart(
                      tooltipBehavior: _tooltip,
                      legend: Legend(isVisible: true),
                      series: <CircularSeries>[
                        PieSeries<ChartDataSize, String>(
                            dataSource: chartDataSize,
                            xValueMapper: (ChartDataSize data, _) => data.x,
                            yValueMapper: (ChartDataSize data, _) => data.y,
                            // Radius for each segment from data source
                            pointRadiusMapper: (ChartDataSize data, _) => data.size
                        )
                      ]
                  )
              )





            ],
          ),
        )

    );

  }
}

class ChartData {
  ChartData(this.x, this.y , this.color);
  final String x;
  final double y;
  final Color color;
}



class ChartDataSize {
  ChartDataSize(this.x, this.y , this.size);
  final String x;
  final double y;
  final String size;
}