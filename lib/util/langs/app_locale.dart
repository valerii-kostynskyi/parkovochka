import 'package:flutter/material.dart';

class ApplicationLocale {
  final String languageCode;
  final String countryCode;

  ApplicationLocale(this.languageCode, this.countryCode);

  Locale toLocale() {
    return Locale(languageCode, countryCode);
  }
}
