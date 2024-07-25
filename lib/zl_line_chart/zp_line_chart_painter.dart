import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_k_chart/format_util.dart';
import 'package:flutter_k_chart/zl_line_chart/zp_line.dart';
import 'package:flutter_k_chart/zl_line_chart/zp_line_chart_params.dart';
import 'package:flutter_k_chart/zl_line_chart/zp_line_style.dart';


class ZpLineChartPainter extends CustomPainter {
  final ZpLineChartParams params;
  const ZpLineChartPainter({required this.params});

  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint

    final data = params.lines;

    /// 先绘制线
    _drawLines(canvas, data);

    /// 绘制网格线
    _drawGridLine(canvas);
  }

  void _drawLines(Canvas canvas, List<ZpLine> data) {

    /// 绘制点集合
    for (var element in data) {
      List<Offset> offsets = [];
      for (int j = 0; j < element.spots.length; j++) {
        final pt = element.spots[j].value; // current data point
        final dx = j * params.volume;
        final dy = params.offsetY(pt);
        /// 获取点位
        Offset offset = Offset(dx, dy);
        offsets.add(offset);
      }

      /// 绘制线
      Paint linePaint = Paint()
        ..strokeWidth = element.lineStyle.width
        ..strokeCap = StrokeCap.round
        ..color = element.lineStyle.color;
      canvas.drawPoints(PointMode.polygon, offsets, linePaint);
    }
  }


  void _drawGridLine(Canvas canvas) {
    canvas.save();

    Paint linePaint = Paint()
      ..strokeWidth = params.gridStyle.width
      ..strokeCap = StrokeCap.round
      ..color = params.gridStyle.color;
    if (params.gridStyle.show) {
      if (params.gridStyle.drawHorizontalLine) {
        canvas.drawLine(const Offset(0, 0), Offset(params.chartWidth, 0), linePaint);
        _drawText(canvas);
        _drawText(canvas);
        canvas.drawLine(Offset(0, params.chartHeight), Offset(params.chartWidth, params.chartHeight), linePaint);
        canvas.drawLine(Offset(0, params.chartHeight/2), Offset(params.chartWidth, params.chartHeight/2), linePaint);
      }

      TextPainter firstPainter = _makeTextPainter(params.start, params.labelStyle);
      Offset firstOffset = Offset(0, params.chartHeight + 3);
      firstPainter.paint(canvas, firstOffset);

      TextPainter secondPainter = _makeTextPainter(params.end, params.labelStyle);
      Offset secondOffset = Offset(params.chartWidth - secondPainter.width, params.chartHeight + 3);
      secondPainter.paint(canvas, secondOffset);
      canvas.restore();
      if (params.gridStyle.drawVerticalLine) {
        // double first = params.chartWidth / 4;
        // double second = params.chartWidth / 4 * 3;

        // ZpSpot firstSpot, secondSpot;
        // int firstIndex = params.getIndexFromOffset(first);
        // int secondIndex = params.getIndexFromOffset(second);
        // if (params.lines.isNotEmpty) {
        //   if (firstIndex < params.lines.first.spots.length) {
        //     firstSpot = params.lines.first.spots[firstIndex];
        //   } else {
        //     firstSpot = params.lines.last.spots[firstIndex];
        //   }
        //   if (secondIndex < params.lines.first.spots.length) {
        //     secondSpot = params.lines.first.spots[secondIndex];
        //   } else {
        //     secondSpot = params.lines.last.spots[secondIndex];
        //   }
        //   canvas.save();

        // }

        canvas.drawLine(Offset(params.chartWidth / 4, 0), Offset(params.chartWidth / 4, params.chartHeight), linePaint);
        canvas.drawLine(Offset(params.chartWidth/4 *3,0), Offset(params.chartWidth / 4 * 3, params.chartHeight), linePaint);
      }
    }
  }

  /// 绘制文本
  void _drawText(Canvas canvas) {

    const double textMargin = 3;
    canvas.save();
    /// max 绘制
    TextPainter maxPainter = _makeTextPainter(params.max.toString(), params.labelStyle);
    Offset maxOffset = const Offset(0, 3);
    maxPainter.paint(canvas, maxOffset);

    String maxAmountStr = FormatUtil.convertValue(params.maxAmount, false);
    TextPainter maxAmountPainter = _makeTextPainter(maxAmountStr, params.labelStyle);
    Offset maxAmountOffset = Offset(params.chartWidth - maxAmountPainter.width , textMargin);
    maxAmountPainter.paint(canvas, maxAmountOffset);


    TextPainter middlePainter = _makeTextPainter(params.middle.toStringAsFixed(2), params.labelStyle);
    Offset middleOffset =  Offset(0, params.chartMiddle - textMargin - 16);
    middlePainter.paint(canvas, middleOffset);

    String middleAmountStr = FormatUtil.convertValue(num.parse(params.middleAmount.toStringAsFixed(2)), false);
    TextPainter middleAmountPainter = _makeTextPainter(middleAmountStr, params.labelStyle);
    Offset middleAmountOffset = Offset(params.chartWidth - middleAmountPainter.width , params.chartMiddle - textMargin - 16);
    middleAmountPainter.paint(canvas, middleAmountOffset);

    TextPainter minPainter = _makeTextPainter(params.min.toString(), params.labelStyle);
    Offset minOffset =  Offset(0, params.chartHeight - textMargin - 16);
    minPainter.paint(canvas, minOffset);

    String minAmountStr = FormatUtil.convertValue(params.minAmount, false);
    TextPainter minAmountPainter = _makeTextPainter(minAmountStr, params.labelStyle);
    Offset minAmountOffset = Offset(params.chartWidth - minAmountPainter.width , params.chartHeight - textMargin - 16);
    minAmountPainter.paint(canvas, minAmountOffset);

    canvas.restore();
  }

  TextPainter _makeTextPainter(String text, LabelStyle labelStyle) {
    return TextPainter(
      text: TextSpan(
        text: text,
        style: labelStyle.textStyle,
      ),
    )
      ..textDirection = TextDirection.ltr
      ..layout();
  }

  @override
  bool shouldRepaint(covariant ZpLineChartPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return params.shouldRepaint(oldDelegate.params);
  }
}
