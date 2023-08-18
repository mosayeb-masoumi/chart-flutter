import 'package:fl_chart_project/fl-chart/pie_chart/model.dart';
import 'package:flutter/material.dart';

class IndicatorWidget extends StatelessWidget {
  const IndicatorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: PieData.data
          .map((data) =>
          Container(
            padding: const EdgeInsets.symmetric(vertical: 2),
            child: buildIndicator(
                color: data.color,
                text: data.name,
                // isSquare:true
            ),
          ))
          .toList(),
    );
  }

  Widget buildIndicator({
    required Color color,
    required String text,
    bool isSquare = false,
    double size = 16,
    Color textColor = const Color(0xFFFFFFFF),

  }) =>
      Row(
        children: [
          Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
                shape: isSquare ? BoxShape.rectangle : BoxShape.circle,
                color: color
            ),
          ),
          const SizedBox(width: 8,),
          Text(text, style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: color),)
        ],
      );
}
