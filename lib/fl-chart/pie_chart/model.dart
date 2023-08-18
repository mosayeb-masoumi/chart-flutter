import 'package:flutter/material.dart';

class PieDataObject {
  final String name ;
  final double percent ;
  final Color color ;
  PieDataObject({required this.name,required this.percent,required this.color});
}

class PieData {
  static List<PieDataObject> data = [
    PieDataObject(name: "Red", percent: 40, color: Colors.red),
    PieDataObject(name: "Blue", percent: 30, color: Colors.blue),
    PieDataObject(name: "Green", percent: 15, color: Colors.green),
    PieDataObject(name: "Purple", percent: 15, color: Colors.deepPurple),
  ];
}