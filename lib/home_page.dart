import 'package:draggable_game/bar_chart.dart';
import 'package:draggable_game/column_chart.dart';
import 'package:draggable_game/doughnut_chart_page.dart';
import 'package:draggable_game/pie_chart_page.dart';
import 'package:draggable_game/pyramid_chart.dart';
import 'package:draggable_game/radial_bar_chart_page.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  // https://help.syncfusion.com/flutter/introduction/api-reference
  // https://help.syncfusion.com/flutter/circular-charts/chart-types/doughnut-chart


  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("charts"), centerTitle: true),
        body: Center(
          child: SingleChildScrollView(
        child: Column(
              children: [

                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DoughnutChartPage()),
                      );
                    },
                    child: Text("Doughnut chart")),


                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PieChartPage()),
                      );
                    },
                    child: Text("Pie chart")),

                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const BarChartPage()),
                      );
                    },
                    child: Text("BAR chart")),



                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const RadiaBarChartPage()),
                      );
                    },
                    child: Text("Radial BAR chart")),


                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PyramidChartPage()),
                      );
                    },
                    child: Text("Pyramid chart")),


                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ColumnChartPage()),
                      );
                    },
                    child: Text("Column chart")),





              ],
            ),
          ),
        ));
  }
}
