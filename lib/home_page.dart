import 'package:fl_chart_project/fl-chart/bar_chart/bar_chart_screen.dart';
import 'package:fl_chart_project/fl-chart/line_chart/line_chart_screen.dart';
import 'package:fl_chart_project/fl-chart/pie_chart/pie_chart_screen.dart';
import 'package:fl_chart_project/syncfusion-chart/bar_chart/bar_chart_screen.dart';
import 'package:fl_chart_project/syncfusion-chart/bar_chart/bar_chart_screen2.dart';
import 'package:fl_chart_project/syncfusion-chart/circular_chart/circular_chart_screen.dart';
import 'package:fl_chart_project/syncfusion-chart/column_chart/column_chart_screen.dart';
import 'package:fl_chart_project/syncfusion-chart/doughnut_chart/doughnut_chart_screen.dart';
import 'package:fl_chart_project/syncfusion-chart/doughnut_chart/doughut_chart_screen2.dart';
import 'package:fl_chart_project/syncfusion-chart/line_chart/line_chart_screen.dart';
import 'package:fl_chart_project/syncfusion-chart/pie_chart/pie_chart_syncfusion2.dart';
import 'package:fl_chart_project/syncfusion-chart/pyramid_chart/pyramid_chart_screen.dart';
import 'package:fl_chart_project/syncfusion-chart/radial_bar_chart/radial_bar_chart_screen.dart';
import 'package:fl_chart_project/syncfusion-chart/radial_bar_chart/radial_barchart_screen2.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
        appBar: AppBar(title: const Text("Charts"),),
        body: SizedBox(
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const BarChartScreen()),
                  );
                }, child:const  Text("FL-BarChart")),


                ElevatedButton(onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LineChartScreen()),
                  );
                }, child:const  Text("FL-LineChart")),


                ElevatedButton(onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const PieChartScreen()),
                  );
                }, child:const  Text("FL-PieChart")),


                ElevatedButton(onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const BarChartSyncFusionScreen()),
                  );
                }, child:const  Text("Syncfusion-BarChart")),


                ElevatedButton(onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const BarChartSyncFusionScreen2()),
                  );
                }, child:const  Text("Syncfusion-BarChart 2")),


                ElevatedButton(onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const CircularChartScreen()),
                  );
                }, child:const  Text("Syncfusion-CircularChart 2")),


                ElevatedButton(onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ColumnChartScreen()),
                  );
                }, child:const  Text("Syncfusion-ColumnChart")),


                ElevatedButton(onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const DoughnutChartScreen()),
                  );
                }, child:const  Text("Syncfusion-DoughnutChart")),


                ElevatedButton(onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const DoughnutChartScreen2()),
                  );
                }, child:const  Text("Syncfusion-DoughnutChart 2")),


                ElevatedButton(onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LineChartSyncfusionScreen()),
                  );
                }, child:const  Text("Syncfusion-LineChart")),


                ElevatedButton(onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const PieChartSyncfusionScreen2()),
                  );
                }, child:const  Text("Syncfusion-PieChart")),


                ElevatedButton(onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const PyramidChartScreen()),
                  );
                }, child:const  Text("Syncfusion-PyramidChart")),


                ElevatedButton(onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const RadialBarChartScreen()),
                  );
                }, child:const  Text("Syncfusion-RadialChart")),


                ElevatedButton(onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const RadialBarChartScreen2()),
                  );
                }, child:const  Text("Syncfusion-RadialChart 2")),



              ],
            ),
          ),
        )
    ));
  }
}
