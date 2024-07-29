
import 'package:flutter/material.dart';
import 'package:flutter_k_chart/zl_line_chart/zp_line.dart';
import 'package:flutter_k_chart/zl_line_chart/zp_line_style.dart';
import 'package:flutter_k_chart/zl_line_chart/zp_spot.dart';
import 'package:get/get.dart';

class RootLogic extends GetxController {


  ZpLine line1 = ZpLine(spots: [
    ZpSpot(date: "2022-10-1", value: 100, amount: 1),
    ZpSpot(date: "2022-10-1", value: 44, amount: 2),
    ZpSpot(date: "2022-10-1", value: 22, amount: 100),
    ZpSpot(date: "2022-10-1", value: 100, amount: 10),
    ZpSpot(date: "2022-10-1", value: 1, amount: 66),
    ZpSpot(date: "2022-10-1", value: 22, amount: 88),
    ZpSpot(date: "2022-10-1", value: 55, amount: 34),
    ZpSpot(date: "2022-10-1", value: 55, amount: 97),
    ZpSpot(date: "2022-10-1", value: 6, amount: 100),
    ZpSpot(date: "2022-10-1", value: 66, amount: 46),
  ], lineStyle: const LineStyle(color: Colors.black12));

  ZpLine line2 = ZpLine(spots: [ZpSpot(date: "2022-10-1", value: 44, amount: 13),
    ZpSpot(date: "2022-10-1", value: 55, amount: 44),
    ZpSpot(date: "2022-10-1", value: 11, amount: 88),
    ZpSpot(date: "2022-10-1", value: 22, amount: 33),
    ZpSpot(date: "2022-10-1", value: 10, amount: 9),
    ZpSpot(date: "2022-10-1", value: 33, amount: 23),
    ZpSpot(date: "2022-10-1", value: 88, amount: 78),
    ZpSpot(date: "2022-10-1", value: 12, amount: 13),
    ZpSpot(date: "2022-10-1", value: 99, amount: 100),
    ZpSpot(date: "2022-10-1", value: 12, amount: 44)], lineStyle: const LineStyle(color: Colors.blue));



  void initData() {

  }


}