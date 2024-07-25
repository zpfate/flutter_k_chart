

import 'package:flutter_k_chart/zl_line_chart/zp_line_style.dart';
import 'package:flutter_k_chart/zl_line_chart/zp_spot.dart';

class ZpLine {
  final LineStyle lineStyle;
  final List<ZpSpot> spots;
  ZpLine({required this.spots, this.lineStyle = const LineStyle()});
}