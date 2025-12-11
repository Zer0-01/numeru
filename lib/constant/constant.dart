import 'package:flutter/material.dart';

class FeatureConstant {
  static const String split = 'split';
  static const String loan = 'loan';
  static const String saving = 'saving';
  static const String fuel = 'fuel';
  static const String unit = 'unit';
  static const String percentage = 'percentage';
  static const String sarvecy = 'sarvecy';
  static const String currency = 'currency';
}

class FeatureIconConstant {
  static const IconData splitIcon = Icons.call_split;
  static const IconData loanIcon = Icons.request_page;
  static const IconData savingIcon = Icons.savings;
  static const IconData fuelIcon = Icons.local_gas_station;
  static const IconData unitIcon = Icons.straighten;
  static const IconData percentageIcon = Icons.percent;
  static const IconData sarvecyIcon = Icons.assignment;
  static const IconData currencyIcon = Icons.currency_exchange;
}

class FeatureColorConstant {
  static const List<Color> splitGradient = [
    Color(0xFF00C6FF),
    Color(0xFF0072FF),
  ];

  static const List<Color> loanGradient = [
    Color(0xFF8E2DE2),
    Color(0xFF4A00E0),
  ];

  static const List<Color> savingGradient = [
    Color(0xFFFFA751),
    Color(0xFFFD7F2C),
  ];

  static const List<Color> fuelGradient = [
    Color(0xFF43CEA2),
    Color(0xFF185A9D),
  ];

  static const List<Color> unitGradient = [
    Color(0xFFF7971E),
    Color(0xFFFFD200),
  ];

  static const List<Color> percentageGradient = [
    Color(0xFF3A1C71),
    Color(0xFFD76D77),
  ];

  static const List<Color> sarvecyGradient = [
    Color(0xFF00F260),
    Color(0xFF0575E6),
  ];

  static const List<Color> currencyGradient = [
    Color(0xFFF5515F),
    Color(0xFF9F041B),
  ];
}

enum RoundingTypeEnum { up, down }

enum FeatureEnum {
  split(
    FeatureConstant.split,
    icon: FeatureIconConstant.splitIcon,
    gradient: FeatureColorConstant.splitGradient,
  ),
  loan(
    FeatureConstant.loan,
    icon: FeatureIconConstant.loanIcon,
    gradient: FeatureColorConstant.loanGradient,
  ),
  saving(
    FeatureConstant.saving,
    icon: FeatureIconConstant.savingIcon,
    gradient: FeatureColorConstant.savingGradient,
  ),
  fuel(
    FeatureConstant.fuel,
    icon: FeatureIconConstant.fuelIcon,
    gradient: FeatureColorConstant.fuelGradient,
  ),
  unit(
    FeatureConstant.unit,
    icon: FeatureIconConstant.unitIcon,
    gradient: FeatureColorConstant.unitGradient,
  ),
  percentage(
    FeatureConstant.percentage,
    icon: FeatureIconConstant.percentageIcon,
    gradient: FeatureColorConstant.percentageGradient,
  ),
  sarvecy(
    FeatureConstant.sarvecy,
    icon: FeatureIconConstant.sarvecyIcon,
    gradient: FeatureColorConstant.sarvecyGradient,
  ),
  currency(
    FeatureConstant.currency,
    icon: FeatureIconConstant.currencyIcon,
    gradient: FeatureColorConstant.currencyGradient,
  );

  final String name;
  final IconData icon;
  final List<Color> gradient;
  const FeatureEnum(this.name, {required this.icon, required this.gradient});
}
