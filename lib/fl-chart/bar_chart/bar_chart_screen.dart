

import 'package:fl_chart_project/fl-chart/bar_chart/bar_chart_widget.dart';
import 'package:flutter/material.dart';

class BarChartScreen extends StatefulWidget {
  const BarChartScreen({super.key});

  @override
  State<BarChartScreen> createState() => _BarChartScreenState();
}

class _BarChartScreenState extends State<BarChartScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: const EdgeInsets.all(20),
          width: size.width,
          height: size.height,
          child: Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(32)
            ),
            // color: const Color(0xff020227),
            
            child:const Padding(padding: EdgeInsets.all(20) ,
            child: BarChartWidget(),),
            
          ) ,
        ),
      ),
    );
  }
}

