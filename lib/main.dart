import 'package:currency/component/my_colors.dart';
import 'package:currency/component/text_style.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: SolidColors.backgroundColor,
        appBar: AppBar(
          backgroundColor: SolidColors.appBarBackgroundColor,
          elevation: 0,
          title: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              "قیمت بروز سکه و ارز",
              style: appBarTextStyle,
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
//TODO how to use svg image in flutter