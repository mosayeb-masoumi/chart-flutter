import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class LineChartScreen extends StatefulWidget {
  const LineChartScreen({super.key});

  @override
  State<LineChartScreen> createState() => _LineChartScreenState();
}

class _LineChartScreenState extends State<LineChartScreen> {
  final List<Color> gradientColor = [Colors.blue, Colors.green];



  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Line chart"),
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
                  height: 320,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.red.shade50,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: ineChartExample1()),
            ],
          ),
        ),
      ),
    );
  }

  Widget ineChartExample1() {
    return LineChart(
      LineChartData(
          minX: 0,
          maxX: 11,
          minY: 0,
          maxY: 6,
          titlesData: FlTitlesData(
              topTitles: const AxisTitles(), // to hide top titles(0-11)
              rightTitles: const AxisTitles(), // to hide right titles (0-6)
              leftTitles: AxisTitles(
                sideTitles: getSideTitles()
                // sideTitles: SideTitles(
                //   reservedSize:20,
                //   showTitles: true,
                //   interval: 1,
                // ),
              ),



              bottomTitles: AxisTitles(
                  sideTitles: getBottomTitles()
              ),

              // bottomTitles: getBottomTitles();
              // bottomTitles: AxisTitles(
              //   sideTitles: SideTitles(
              //     reservedSize: 20,
              //     showTitles: true,
              //     interval: 1,
              //     getTitlesWidget: (value, meta) {
              //       switch (value) {
              //         case 0:
              //           return createBottomText("Jan");
              //         case 1:
              //           return createBottomText("Feb");
              //         case 2:
              //           return createBottomText("Mar");
              //         case 3:
              //           return createBottomText("Jan");
              //         case 4:
              //           return createBottomText("Apr");
              //         case 5:
              //           return createBottomText("May");
              //         case 6:
              //           return createBottomText("Jun");
              //         case 7:
              //           return createBottomText("Jul");
              //         case 8:
              //           return createBottomText("Sep");
              //         case 9:
              //           return createBottomText("Oct");
              //         case 10:
              //           return createBottomText("Nov");
              //         default:
              //           return createBottomText("Dec");
              //       }
              //     },
              //   ),
              // )
          ),

          // backgroundColor: Colors.green.shade300,
          gridData: const FlGridData(
            show: true,

            drawHorizontalLine: true,
            drawVerticalLine: true,

            // ti customize horizontal line
            // getDrawingHorizontalLine: (value) {
            //   return const FlLine(color: Colors.pink, strokeWidth: 5);
            // },

            // ti customize horizontal line
            // getDrawingVerticalLine: (value) {
            //   return const FlLine(
            //       color: Colors.green ,
            //       strokeWidth: 3
            //   );
            // },
          ),
          borderData: FlBorderData(
              show: true, border: Border.all(color: Colors.green, width: 2)),
          lineBarsData: [
            LineChartBarData(
                spots: [
                  const FlSpot(0, 3),
                  const FlSpot(2.6, 2),
                  const FlSpot(4.9, 5),
                  const FlSpot(6.8, 2.5),
                  const FlSpot(8, 4),
                  const FlSpot(9.5, 3),
                  const FlSpot(11, 4),
                ],
                isCurved: true,
                barWidth: 5,
                isStrokeCapRound: true,
                show: true,
                gradient: LinearGradient(colors: gradientColor),
                // dotData: FlDotData(show: false),
                belowBarData: BarAreaData(
                    show: true,
                    gradient: LinearGradient(
                        colors: gradientColor
                            .map((color) => color.withOpacity(0.3))
                            .toList()),
                    spotsLine: const BarAreaSpotsLine(
                        show: true,
                        flLineStyle: FlLine(
                            dashArray: [5, 5],
                            strokeWidth: 3,
                            color: Colors.red)))

                // curveSmoothness: 0.5
                )
          ]),
      duration: const Duration(milliseconds: 2000),
    );
  }



  SideTitles getSideTitles() => SideTitles(
      showTitles: true,
      reservedSize: 40,
      interval: 1,
      getTitlesWidget: (value , meta) =>
          createText(value==0 ?"0" : "${value.toInt()} K" , 45)
  );



 SideTitles getBottomTitles() => SideTitles(
      showTitles: true,
      reservedSize: 40,
      interval: 1,
      getTitlesWidget: (value , meta) {
        String name = LineDataList.data.firstWhere((element) => element.id  == value.toInt()).name;
        return createText(name , 45);
      }

  );

  static Widget createText(String value , double rotation) {
    return Transform.rotate(
      angle: rotation * 3.14159 / 180,
      child: Text(
        value,
        style: const TextStyle(
            color: Colors.blue, fontSize: 15, fontWeight: FontWeight.bold),
      ),
    );
  }


}


// data ////
class LineModel {
  int id;
  String name;
  LineModel(
      {required this.id,
        required this.name,
      });
}
class LineDataList {
  static List<LineModel> data = [
    LineModel(id: 0, name: "Jan"),
    LineModel(id: 1, name: "Feb"),
    LineModel(id: 2, name: "Mar"),
    LineModel(id: 3, name: "Jan"),
    LineModel(id: 4, name: "Apr"),
    LineModel(id: 5, name: "May"),
    LineModel(id: 6, name: "Jun"),
    LineModel(id: 7, name: "Jul"),
    LineModel(id: 8, name: "Sep"),
    LineModel(id: 9, name: "Oct"),
    LineModel(id: 10, name: "Nov"),
    LineModel(id: 11, name: "Dec"),

  ];
}

