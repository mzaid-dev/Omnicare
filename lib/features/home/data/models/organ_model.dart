import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';


class OrganModel {
  final String name;
  final String coloredAsset;
  final String greyAsset;

  final Color accent;
  final IconData card1Icon;
  final IconData card2Icon;
  final IconData card3Icon;

  final String card1Title;
  final String card1Value;
  final List<FlSpot> card1Data;

  final String card2Title;
  final String card2Value;
  final List<double> card2Data;

  final String card3Title;
  final String card3Value;
  final List<double> card3Data;

  const OrganModel({
    required this.name,
    required this.coloredAsset,
    required this.greyAsset,
    required this.accent,
    required this.card1Icon,
    required this.card2Icon,
    required this.card3Icon,
    required this.card1Title,
    required this.card1Value,
    required this.card1Data,
    required this.card2Title,
    this.card2Value = '',
    required this.card2Data,
    required this.card3Title,
    this.card3Value = '',
    required this.card3Data,
  });
}