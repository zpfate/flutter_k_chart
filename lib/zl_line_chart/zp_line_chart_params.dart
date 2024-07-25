import 'dart:ui';

import 'package:flutter_k_chart/zl_line_chart/zp_line.dart';
import 'package:flutter_k_chart/zl_line_chart/zp_line_style.dart';


class ZpLineChartParams {
  final String start;
  final String end;

  final Size size;
  final double max;
  final double min;
  final double maxAmount;
  final double minAmount;
  final List<ZpLine> lines;
  final LabelStyle labelStyle;
  final GridStyle gridStyle;

  ZpLineChartParams({
    required this.start,
    required this.end,
    required this.size,
    required this.max,
    required this.min,
    required this.maxAmount,
    required this.minAmount,
    this.lines = const [],
    this.gridStyle = const GridStyle(),
    this.labelStyle = const LabelStyle(),
  });

  double offsetY(num y) {
    return chartHeight * ((max - y) / (max - min));
  }

  int getIndexFromOffset(double x) {
    final adjustedPos = x + volume / 2;
    final i = adjustedPos ~/ volume;
    return i;
  }

  bool shouldRepaint(ZpLineChartParams old) {
    if (old.lines.length != lines.length) return true;
    return
        gridStyle != old.gridStyle ||
        labelStyle != old.labelStyle;
  }

  double get chartWidth => size.width;
  double get chartHeight => size.height;
  double get chartMiddle => size.height / 2;

  double get middle => min + (max - min) / 2;
  double get middleAmount => minAmount + (maxAmount - minAmount) / 2;

  // ZpSpot getPointFromOffset(double x) {
  //   return lines[getIndexFromOffset(x)];
  // }

  double get volume {
    if (lines.isEmpty || lines.length == 1) {
      return 1;
    }
    int maxValue = 0;
    for (var e in lines) {
      maxValue = maxValue > e.spots.length ? maxValue : e.spots.length;
    }
    return chartWidth / (maxValue - 1);
  }
}
