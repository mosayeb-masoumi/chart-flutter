
import 'package:fl_chart_project/fl-chart/bar_chart/bar_chart_screen.dart';
import 'package:fl_chart_project/fl-chart/line_chart/line_chart_screen.dart';
import 'package:fl_chart_project/fl-chart/pie_chart/pie_chart_screen.dart';
import 'package:fl_chart_project/home_page.dart';
import 'package:fl_chart_project/syncfusion-chart/bar_chart/bar_chart_screen.dart';
import 'package:fl_chart_project/syncfusion-chart/bar_chart/bar_chart_screen2.dart';
import 'package:fl_chart_project/syncfusion-chart/circular_chart/circular_chart_screen.dart';
import 'package:fl_chart_project/syncfusion-chart/column_chart/column_chart_screen.dart';
import 'package:fl_chart_project/syncfusion-chart/doughnut_chart/doughut_chart_screen2.dart';
import 'package:fl_chart_project/syncfusion-chart/line_chart/line_chart_screen.dart';
import 'package:fl_chart_project/syncfusion-chart/pie_chart/pie_chart_syncfusion2.dart';
import 'package:fl_chart_project/syncfusion-chart/pyramid_chart/pyramid_chart_screen.dart';
import 'package:fl_chart_project/syncfusion-chart/radial_bar_chart/radial_barchart_screen2.dart';
// import 'package:fl_chart_project/syncfusion-chart/radio_bar_chart/radial_bar_chart_screen.dart';
import 'package:flutter/material.dart';

import 'syncfusion-chart/doughnut_chart/doughnut_chart_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),


      home: const HomePage(),


      /////// Fl-Chart /////////
      // home: const LineChartScreen(),
      // home: const PieChartScreen(),
      // home: const BarChartScreen(),



      //syncfusion_flutter_charts
      //   home: const CircularChartScreen(),
      //  home: const RadialBarChartScreen2(),
      //   home: const DoughnutChartScreen(),
      //   home: const DoughnutChartScreen2(),
      //   home: const PieChartSyncfusionScreen2(),
      //   home: const PyramidChartScreen(),
      //   home: const RadialBarChartScreen(),
      //   home: const BarChartSyncFusionScreen(),
      //   home: const BarChartSyncFusionScreen2(),
      //   home: const ColumnChartScreen(),
      //   home: const LineChartSyncfusionScreen(),

    );
  }
}


