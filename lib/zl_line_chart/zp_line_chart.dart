
import 'package:flutter/material.dart';
import 'package:flutter_k_chart/zl_line_chart/zp_line.dart';
import 'package:flutter_k_chart/zl_line_chart/zp_line_chart_painter.dart';
import 'package:flutter_k_chart/zl_line_chart/zp_line_chart_params.dart';
import 'package:flutter_k_chart/zl_line_chart/zp_line_style.dart';

class ZpLineChart extends StatefulWidget {
  final String start;
  final String end;
  final double max;
  final double min;
  final double maxAmount;
  final double minAmount;
  final LabelStyle labelStyle;
  final GridStyle gridStyle;
  final List<ZpLine> data;
  const ZpLineChart({
    super.key,
    required this.start,
    required this.end,
    required this.max,
    required this.min,
    required this.maxAmount,
    required this.minAmount,
    required this.data,
    this.labelStyle = const LabelStyle(),
    this.gridStyle = const GridStyle(),
  });

  @override
  State<ZpLineChart> createState() => _ZpLineChartState();
}

class _ZpLineChartState extends State<ZpLineChart> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      final size = constraints.biggest;

      return Listener(
        child: GestureDetector(
          child: RepaintBoundary(
            child: CustomPaint(
              painter: ZpLineChartPainter(
                  params: ZpLineChartParams(
                    start: widget.start,
                      end: widget.end,
                      size: size,
                      max: widget.max,
                      min: widget.min,
                      maxAmount: widget.maxAmount,
                      minAmount: widget.minAmount,
                      lines: widget.data,
                      gridStyle: widget.gridStyle,
                      labelStyle: widget.labelStyle)),
            ),
          ),
        ),
      );
    });
  }
}
