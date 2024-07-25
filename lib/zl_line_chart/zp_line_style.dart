import 'package:flutter/material.dart';

class LineStyle {
  final Color color;
  final double width;
  final double volume;
  const LineStyle({this.width = 1, this.volume = 1, this.color = Colors.black});
}

class LabelStyle {
  final double? width;
  final TextStyle textStyle;
  const LabelStyle({this.width, this.textStyle = const TextStyle()});
}


class GridStyle {
  /// 是否展示网格线
  final bool show;
  /// 是否绘制垂直网格线
  final bool drawVerticalLine;
  /// 是否绘制水平网格线
  final bool drawHorizontalLine;
  final Color color;
  final double width;
  const GridStyle(
      {this.show = false,
      this.drawHorizontalLine = true,
      this.drawVerticalLine = true,
      this.width = 0.5,
      this.color = Colors.black});
}
