import 'package:currency/component/my_colors.dart';
import 'package:currency/component/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Localizations Sample App',
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('fa'), // Farsi
      ],
      home: Scaffold(
        backgroundColor: SolidColors.backgroundColor,
        appBar: AppBar(
          backgroundColor: SolidColors.appBarBackgroundColor,
          elevation: 0,
          title:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            SvgPicture.asset(
              "assets/images/money-bag-svgrepo-com 1.svg",
              width: 41,
              height: 41,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 12),
              child: Text(
                "قیمت بروز سکه و ارز",
                style: appBarTextStyle,
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.centerLeft,
                child: SvgPicture.asset(
                  "assets/images/menu-svgrepo-com 1.svg",
                  width: 37,
                  height: 37,
                ),
              ),
            )
          ]),
        ),
        body: const Column(
          children: [],
        ),
      ),
    );
  }
}
