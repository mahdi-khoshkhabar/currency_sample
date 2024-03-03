import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'component/my_colors.dart';
import 'component/text_style.dart';

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
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                "assets/images/money-bag-svgrepo-com 1.svg",
                width: 35,
                height: 35,
              ),
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
                  child: IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      "assets/images/menu-svgrepo-com 1.svg",
                      width: 35,
                      height: 35,
                    ),
                  )),
            )
          ]),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              //headline 1, first row of main body
              Row(
                children: [
                  //question mark
                  SvgPicture.asset(
                    "assets/images/question-circle-svgrepo-com 1.svg",
                    width: 35,
                    height: 35,
                  ),
                  //space
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    "نرخ ارز آزاد چیست؟",
                    style: headline1TextStyle.copyWith(
                        color: SolidColors.headline1Color),
                  )
                ],
              ),
              //description
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "نرخ ارز ها از معاملات نقدی و رایج روزانه است. معاملات نقدی معاملاتی هستند که خریدار و فروشنده به محض انجام معامله، ارز و ریال را با هم تبادل می نمایند.",
                  style: descriptionTextStyle.copyWith(
                      color: SolidColors.descriptionColor),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              //list view title
              Container(
                width: double.infinity,
                height: 39,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(1000),
                    color: SolidColors.listViewTitleColor),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "نام آزاد ارز",
                      style: listViewTitleTextStyle,
                    ),
                    Text(
                      "قیمت",
                      style: listViewTitleTextStyle,
                    ),
                    Text(
                      "تغییرات",
                      style: listViewTitleTextStyle,
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: 500,
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: Container(
                          width: double.infinity,
                          height: 59,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(1000),
                              color: Colors.green),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                "Data",
                                style: listViewTitleTextStyle,
                              ),
                              Text(
                                "Data",
                                style: listViewTitleTextStyle,
                              ),
                              Text(
                                "Data",
                                style: listViewTitleTextStyle,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: Container(
                          width: double.infinity,
                          height: 59,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(1000),
                              color: Colors.red),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                "Ad",
                                style: listViewTitleTextStyle,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    itemCount: 20),
              )
            ],
          ),
        ),
      ),
    );
  }
}
