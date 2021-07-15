import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:rtl_flutter/rout/routconstant.dart';
import 'package:rtl_flutter/rout/routs.dart';
import 'Localization/demolocalization.dart';
import 'Localization/localization_constants.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  MyApp({Key? key, }) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
  
  static void setLocale(BuildContext context, Locale newLocale) {
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state!.setLocale(newLocale);
  }
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;

  Future<dynamic> setLocale( Locale locale) async {
    setState(() {
      _locale = locale;
    });
  }

  @override
  void didChangeDependencies() {
    getLocale().then((locale) {
      setState(() {
        this._locale = locale;
      });
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {

      return MaterialApp(

      debugShowCheckedModeBanner: false,
      // theme: hrTheme,
      locale: _locale,
      supportedLocales: [
        Locale("en", "US"),
        Locale("fa", "IR"),
        Locale("ar", "SA"),
        Locale("hi", "IN")
      ],
      localizationsDelegates: [
        DemoLocalization.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      localeResolutionCallback: (locale, supportedLocales) {
        for (var supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale!.languageCode &&
              supportedLocale.countryCode == locale.countryCode) {
            return supportedLocale;
          }
        }
        return supportedLocales.first;
      },
      onGenerateRoute: Routes.generatedRoute,
      initialRoute: initialRoute,
    );
    }
  // }
}

