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
  static const IconData splitIcon = Icons.pie_chart;
  static const IconData loanIcon = Icons.request_page;
  static const IconData savingIcon = Icons.savings;
  static const IconData fuelIcon = Icons.local_gas_station;
  static const IconData unitIcon = Icons.straighten;
  static const IconData percentageIcon = Icons.percent;
  static const IconData sarvecyIcon = Icons.assignment;
  static const IconData currencyIcon = Icons.currency_exchange;
}

class LocaleConstant {
  static const String en = 'en';
  static const String ms = 'ms';
}

class LocaleNameConstant {
  static const String en = 'English';
  static const String ms = 'Bahasa Melayu';
}

enum FeatureEnum {
  split(FeatureConstant.split, icon: FeatureIconConstant.splitIcon),
  loan(FeatureConstant.loan, icon: FeatureIconConstant.loanIcon),
  saving(FeatureConstant.saving, icon: FeatureIconConstant.savingIcon),
  fuel(FeatureConstant.fuel, icon: FeatureIconConstant.fuelIcon),
  unit(FeatureConstant.unit, icon: FeatureIconConstant.unitIcon),
  currency(FeatureConstant.currency, icon: FeatureIconConstant.currencyIcon);

  final String name;
  final IconData icon;
  const FeatureEnum(this.name, {required this.icon});
}

enum LocaleEnum {
  en(LocaleConstant.en, LocaleNameConstant.en),
  ms(LocaleConstant.ms, LocaleNameConstant.ms);

  final String value;
  final String title;

  const LocaleEnum(this.value, this.title);
}
