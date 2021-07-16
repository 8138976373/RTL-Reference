import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'demolocalization.dart';

const String LAGUAGE_CODE_RTL = 'languageCode';

//languages code
const String ENGLISH = 'en';
const String FARSI = 'fa';
const String ARABIC = 'ar';
const String HINDI = 'hi';

Future<Locale> setLocale(String languageCode) async {
  SharedPreferences _preference = await SharedPreferences.getInstance();
  await _preference.setString(LAGUAGE_CODE_RTL, languageCode);
  return _locale(languageCode);
}

Future<Locale> getLocale() async {
  SharedPreferences _preference = await SharedPreferences.getInstance();
  String languageCode = _preference.getString(LAGUAGE_CODE_RTL) ?? "en";
  return _locale(languageCode);
}

Locale _locale(String languageCode) {
  switch (languageCode) {
    case ENGLISH:
      return Locale(ENGLISH, 'US');
    case FARSI:
      return Locale(FARSI, "IR");
    case ARABIC:
      return Locale(ARABIC, "SA");
    case HINDI:
      return Locale(HINDI, "IN");
    default:
      return Locale(ENGLISH, 'US');
  }
}

 String? getTranslated(BuildContext context, String key)  {
  return  DemoLocalization.of(context)!.translate(key);

  // double? getTranslatedDouble(BuildContext context, String key)  {
  //   return  DemoLocalization.of(context)!.translate(key);
  // }
}