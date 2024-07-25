
import 'package:intl/intl.dart';

class FormatUtil {
  var format = NumberFormat("#,##0.00", "en_US");

  String getFormatStep(num? step) {
    // return format.format(step??0).round(scale: 2);
    return step == null
        ? "--"
        : format.format(num.parse((step).toString()));
  }

  static convertValue(num value, bool isHK) {
    String unit = "";
    if (true) {
      if (value.abs() >= 10000.0 && value.abs() < 99999999.0) {
        value = value / 10000.0;
        unit = "万";
      } else if (value.abs() >= 100000000.0 && value.abs() <= 999999999999.0) {
        value = value / 100000000.0;
        unit = "亿";
      } else if (value.abs() >= 1000000000000.0) {
        value = value / 1000000000000.0;
        unit = "万亿";
      }
    } else {
      if (value.abs() >= 1000.0 && value.abs() < 999999.0) {
        value = value / 1000.0;
        unit = "K";
      } else if (value.abs() >= 1000000.0 && value.abs() <= 999999999.0) {
        value = value / 1000000.0;
        unit = "M";
      } else if (value.abs() >= 1000000000.0 && value.abs() <= 999999999999.0) {
        value = value / 1000000000.0;
        unit = "B";
      } else if (value.abs() >= 1000000000000.0) {
        value = value / 1000000000000.0;
        unit = "T";
      }
    }
    return "${value.toStringAsFixed(isHK ? value < 0.5 ? 3 : 2 : 2)}$unit";
  }
}
