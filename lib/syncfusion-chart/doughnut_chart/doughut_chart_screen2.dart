import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DoughnutChartScreen2 extends StatefulWidget {
  const DoughnutChartScreen2({Key? key}) : super(key: key);

  @override
  State<DoughnutChartScreen2> createState() => _DoughnutChartScreen2State();
}


// https://help.syncfusion.com/flutter/circular-charts/chart-types/doughnut-chart

class _DoughnutChartScreen2State extends State<DoughnutChartScreen2> {

  late List<ChartData> chartData;
  late TooltipBehavior _tooltip;

  @override
  void initState() {
    chartData = [
      ChartData('David', 25, Color.fromRGBO(9,0,136,1)),
      ChartData('Steve', 38, Color.fromRGBO(147,0,119,1)),
      ChartData('Jack', 34, Color.fromRGBO(228,0,124,1)),
      ChartData('Others', 52, Color.fromRGBO(255,189,57,1))
    ];
    _tooltip = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(title: Text("Doughnut chart"), centerTitle: true),

        body: SingleChildScrollView(
          child: Column(
            children: [

              Container(
                  child: SfCircularChart(

                      legend: Legend(isVisible: true),
                      tooltipBehavior: _tooltip,

                      series: <CircularSeries>[
                        // Renders doughnut chart
                        DoughnutSeries<ChartData, String>(
                            dataSource: chartData,
                            pointColorMapper:(ChartData data,  _) => data.color,
                            xValueMapper: (ChartData data, _) => data.x,
                            yValueMapper: (ChartData data, _) => data.y,

                            radius: '70%'
                        )
                      ]
                  )
              ),



              Container(
                  child: SfCircularChart(
                      legend: Legend(isVisible: true),
                      tooltipBehavior: _tooltip,
                      series: <CircularSeries>[
                        DoughnutSeries<ChartData, String>(
                            dataSource: chartData,
                            xValueMapper: (ChartData data, _) => data.x,
                            yValueMapper: (ChartData data, _) => data.y,
                            // Corner style of doughnut segment
                            // cornerStyle: CornerStyle.bothCurve,
                            cornerStyle: CornerStyle.startCurve,

                            radius: '70%'
                        )
                      ]
                  )
              ),




              Container(
                  child: SfCircularChart(
                      annotations: <CircularChartAnnotation>[
                        CircularChartAnnotation(
                            widget: Container(
                                width: 80,
                                height: 80,
                                child: PhysicalModel(
                                    child: Container(),
                                    shape: BoxShape.circle,
                                    elevation: 10,
                                    shadowColor: Colors.black,
                                    color: const Color.fromRGBO(230, 230, 230, 1)))),
                        CircularChartAnnotation(widget: Container(child: const Text('62%', style: TextStyle(color: Color.fromRGBO(0, 0, 0, 0.5), fontSize: 25))))
                      ],

                      legend: Legend(isVisible: true),
                      tooltipBehavior: _tooltip,
                      series: <CircularSeries>[
                        DoughnutSeries<ChartData, String>(
                            dataSource: chartData,
                            xValueMapper: (ChartData data, _) => data.x,
                            yValueMapper: (ChartData data, _) => data.y,
                            // Radius of doughnut
                            radius: '70%',
                            innerRadius: '50%'
                        )
                      ]
                  )
              ),




              Container(
                  child: SfCircularChart(
                      legend: Legend(isVisible: true),
                      tooltipBehavior: _tooltip,
                      series: <CircularSeries>[
                        DoughnutSeries<ChartData, String>(
                            dataSource: chartData,
                            xValueMapper: (ChartData data, _) => data.x,
                            yValueMapper: (ChartData data, _) => data.y,
                            pointColorMapper: (ChartData data, _) => data.color,
                            // Radius of doughnut
                            radius: '70%',
                            innerRadius: '90%'
                        )
                      ]
                  )
              ),



              Container(
                  child: SfCircularChart(
                      legend: Legend(isVisible: true),
                      tooltipBehavior: _tooltip,
                      series: <CircularSeries>[
                        DoughnutSeries<ChartData, String>(
                            dataSource: chartData,
                            xValueMapper: (ChartData data, _) => data.x,
                            yValueMapper: (ChartData data, _) => data.y,
                            // Explode the segments on tap
                            explode: true,
                            explodeIndex: 1
                        )
                      ]
                  )
              ),


              Container(
                  child: SfCircularChart(
                      legend: Legend(isVisible: true),
                      tooltipBehavior: _tooltip,
                      series: <CircularSeries>[
                        DoughnutSeries<ChartData, String>(
                            dataSource: chartData,
                            xValueMapper: (ChartData data, _) => data.x,
                            yValueMapper: (ChartData data, _) => data.y,
                            // Explode the segments on tap
                            explode: true,
                            explodeAll: true
                        )
                      ]
                  )
              ),


              Container(
                  child: SfCircularChart(
                      legend: Legend(isVisible: true),
                      tooltipBehavior: _tooltip,

                      series: <CircularSeries>[
                        DoughnutSeries<ChartData, String>(
                            dataSource: chartData,
                            xValueMapper: (ChartData data, _) => data.x,
                            yValueMapper: (ChartData data, _) => data.y,
                            // Starting angle of doughnut
                            startAngle: 270,
                            // Ending angle of doughnut
                            endAngle: 90,

                            explode: true,
                            explodeIndex: 2
                        )
                      ]
                  )
              ),


              Container(

                  child: SfCircularChart(
                      legend: Legend(isVisible: true),
                      tooltipBehavior: _tooltip,
                      series: <CircularSeries>[
                        DoughnutSeries<ChartData, String>(
                            dataSource: chartData,
                            xValueMapper: (ChartData data, _) => data.x,
                            yValueMapper: (ChartData data, _) => data.y,
                            // Mode of grouping
                            groupMode: CircularChartGroupMode.point,
                            groupTo: 2
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