import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class BarChartWidget extends StatelessWidget {
  const BarChartWidget({super.key});

  final double barWidth = 15;

  @override
  Widget build(BuildContext context) {
    return BarChart(BarChartData(
      alignment: BarChartAlignment.center,
      maxY: 15,
      minY: -15,
      groupsSpace: 10, // space between bars
      barTouchData: BarTouchData(enabled: true),

      gridData: FlGridData(
        show: true,
        // to show red horizontal line with interval 3
        checkToShowHorizontalLine: (value) => value % 3 == 0,
        getDrawingHorizontalLine: (value) {
          if(value ==0){
            return  FlLine(
              color: Colors.black,
              strokeWidth: 3,
            );
          }else{
            return  FlLine(
              color: Colors.red.withOpacity(0.5),
              strokeWidth: 0.8,
            );
          }
        },
      ),

      barGroups: _chartGroups(),
      titlesData: FlTitlesData(
        topTitles: const AxisTitles(),  // to clear top titles
        rightTitles: const AxisTitles(), // to clear right titles
        bottomTitles: AxisTitles(
          sideTitles: getBottomTitles()
        ),
        leftTitles: AxisTitles(
          sideTitles: getSideTitles()
        ),

      ),
    ));
  }

  List<BarChartGroupData> _chartGroups() {
    return BarDataList.data
        .map((point) => BarChartGroupData(
                x: point.x.toInt(),
                // barsSpace: 4,  when below list has mor then 1 item
                barRods: [
                  BarChartRodData(
                      toY: point.y,
                      color: point.color,
                      width: 20,
                      borderRadius: point.y > 0
                          ? const BorderRadius.only(
                              topRight: Radius.circular(6),
                              topLeft: Radius.circular(6))
                          : const BorderRadius.only(
                              bottomLeft: Radius.circular(6),
                              bottomRight: Radius.circular(6))),

                  // BarChartRodData(
                  //     toY: point.y,
                  //     color: point.color,
                  //     width: 20,
                  //     borderRadius: point.y > 0
                  //         ? const BorderRadius.only(
                  //         topRight: Radius.circular(6),
                  //         topLeft: Radius.circular(6))
                  //         : const BorderRadius.only(
                  //         bottomLeft: Radius.circular(6),
                  //         bottomRight: Radius.circular(6))),
                ]))
        .toList();

  }





  static SideTitles getSideTitles() => SideTitles(
    showTitles: true,
    reservedSize: 30,

    interval: 3,
    getTitlesWidget: (value , meta) =>
        createBottomText(value==0 ?"0" : "${value.toInt()} K" , 45)
  );


  static SideTitles getBottomTitles() => SideTitles(
      showTitles: true,
      reservedSize: 30,
      getTitlesWidget: (value , meta) {
        String name = BarDataList.data.firstWhere((element) => element.id  == value.toInt()).name;
        return createBottomText(name , 45);
      }

  );

  static Widget createBottomText(String value , double rotation) {
    return Transform.rotate(
      angle: rotation * 3.14159 / 180,
      child: Text(
        value,
        style: const TextStyle(
            color: Colors.blue, fontSize: 12, fontWeight: FontWeight.bold),
      ),
    );
  }

}



// data ////
class PricePoint {
  int id;
  String name;
  int x;
  double y;
  Color color;

  PricePoint(
      {required this.id,
      required this.name,
      required this.x,
      required this.y,
      required this.color});
}

class BarDataList {
  static List<PricePoint> data = [
    PricePoint(id: 0, name: "Mon", x: 0, y: 14, color: Colors.red),
    PricePoint(id: 1, name: "Tue",  x: 1, y: -12, color: Colors.blue),
    PricePoint(id: 2, name: "Wed", x: 2, y: 11, color: Colors.green),
    PricePoint(id: 3, name: "Thu", x: 3, y: 7, color: Colors.brown),
    PricePoint(id: 4, name: "Fri", x: 4, y: -5, color: Colors.yellow),
    PricePoint(id: 5, name: "Sat", x: 5, y: 10, color: Colors.blueGrey),
    PricePoint(id: 6, name: "Sun", x: 6, y: -9, color: Colors.black),
  ];
}




