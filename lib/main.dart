import 'package:calculadora_hubbell/pages/home_page.dart';
import 'package:flutter/material.dart';

import 'package:flutter_localizations/flutter_localizations.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          const Locale('en', ''), // English, no country code
          const Locale('es', 'ES'), // Hebrew, no country code
        ],
        debugShowCheckedModeBanner: false,
        title: 'Hubbell Calculator',
        initialRoute: 'home',
        routes: {'home': (_) => HomePage()},
        theme: ThemeData.from(
            colorScheme:
                ColorScheme.light(primary: Color.fromRGBO(250, 225, 54, 1.0))));
  }
}
