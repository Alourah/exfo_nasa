import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension DateExtensions on DateTime {
  String shortDate() => DateFormat('yyyy-MM-dd').format(this);

  String monthDate() => DateFormat('yyyy-MM').format(this);

  DateTime lastMidnight() => DateTime(year, month, day);

  DateTime startOfTheWeek() => DateTime.now().subtract(Duration(days: DateTime.now().weekday - 1)).lastMidnight();

  DateTime startOfTheMonth() => DateTime(year, month, 1);

  DateTime startOfTheYear() => DateTime(year, 1, 1);

  DateTime startOfTheLastThreeMonths() => DateTime(year, month - 2, 1);

  DateTime startOfTheLastThreeYears() => DateTime(year - 2, 1, 1);
}

extension ColorExt on TextStyle {
  TextStyle withColor(Color color) => copyWith(color: color);
}
