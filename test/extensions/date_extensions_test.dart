import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nasa_workshop/core/extension/extensions.dart';

void main() {
  test('Test shortDate()', () {
    final date = DateTime(2023, 7, 11);
    expect(date.shortDate(), '2023-07-11');
  });

  test('Test monthDate()', () {
    final date = DateTime(2023, 7, 11);
    expect(date.monthDate(), '2023-07');
  });

  test('Test lastMidnight()', () {
    final date = DateTime(2023, 7, 11, 15, 30, 45);
    final lastMidnight = DateTime(2023, 7, 11);
    expect(date.lastMidnight(), lastMidnight);
  });

  test('Test startOfTheWeek()', () {
    final date = DateTime(2023, 7, 11);
    final startOfWeek = DateTime(2023, 7, 10);
    expect(date.startOfTheWeek(), startOfWeek);
  });

  test('Test startOfTheMonth()', () {
    final date = DateTime(2023, 7, 11);
    final startOfMonth = DateTime(2023, 7, 1);
    expect(date.startOfTheMonth(), startOfMonth);
  });

  test('Test startOfTheYear()', () {
    final date = DateTime(2023, 7, 11);
    final startOfYear = DateTime(2023, 1, 1);
    expect(date.startOfTheYear(), startOfYear);
  });

  test('Test startOfTheLastThreeMonths()', () {
    final date = DateTime(2023, 7, 11);
    final startOfLastThreeMonths = DateTime(2023, 5, 1);
    expect(date.startOfTheLastThreeMonths(), startOfLastThreeMonths);
  });

  test('Test startOfTheLastThreeYears()', () {
    final date = DateTime(2023, 7, 11);
    final startOfLastThreeYears = DateTime(2021, 1, 1);
    expect(date.startOfTheLastThreeYears(), startOfLastThreeYears);
  });

  test('Test withColor()', () {
    const textStyle = TextStyle(fontSize: 16);
    const color = Colors.red;
    final modifiedTextStyle = textStyle.withColor(color);
    expect(modifiedTextStyle.color, color);
  });
}
