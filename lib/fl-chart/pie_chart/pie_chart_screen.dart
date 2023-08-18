
import 'package:fl_chart/fl_chart.dart';
import 'package:fl_chart_project/fl-chart/pie_chart/indicator_widget.dart';
import 'package:fl_chart_project/fl-chart/pie_chart/model.dart';
import 'package:flutter/material.dart';

class PieChartScreen extends StatefulWidget {
  const PieChartScreen({super.key});

  @override
  State<PieChartScreen> createState() => _PieChartScreenState();
}

class _PieChartScreenState extends State<PieChartScreen> {

 // https://www.youtube.com/watch?v=rZx_isqXrhg

  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pie chart"),
      ),
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  margin:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  width: size.width,
                  height: 400,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: Colors.red.shade50,
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: pieChartExample()),

               // show indicators
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   Padding(padding: EdgeInsets.all(16) ,
                   child: IndicatorWidget(),)
                ],
              )

            ],
          ),
        ),
      ),
    );
  }

  Widget pieChartExample() {

    return PieChart(
      PieChartData(
          borderData: FlBorderData(show: false, border: Border.all(color: Colors.red , width: 2)),
        sectionsSpace: 5,
        centerSpaceRadius: 70,
        centerSpaceColor: Colors.yellow,
        sections: getSections(touchedIndex),

        pieTouchData: PieTouchData(

          touchCallback: (FlTouchEvent event, pieTouchResponse) {
            setState(() {

              if (!event.isInterestedForInteractions ||
                  pieTouchResponse == null ||
                  pieTouchResponse.touchedSection == null) {
                touchedIndex = -1;
                return;
              }
              touchedIndex = pieTouchResponse.touchedSection!.touchedSectionIndex;


            });
          },
        )

      )
    );
  }


}


List<PieChartSectionData> getSections(int touchedIndex) => PieData.data
    .asMap()
    .map<int, PieChartSectionData>((index, data) {

      final isTouched = index == touchedIndex ;
      final double fontSize = isTouched ? 25 : 16 ;
      final double radius = isTouched ? 100 : 70 ;


  final value = PieChartSectionData(
      color: data.color,
      value: data.percent,
      title: "${data.percent}",
      radius: radius,

      titleStyle:  TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
          color: const Color(0xFFFFFFFF)));
  return MapEntry(index, value);
})
    .values
    .toList();
