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
    var size = MediaQuery.of(context).size;
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
        appBar: appBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SafeArea(
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
                  listViewTitle(),
                  //list view
                  listView(size),
                  const SizedBox(
                    height: 15,
                  ),
                  //update box
                  updateBox(size)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      backgroundColor: SolidColors.appBarBackgroundColor,
      elevation: 0,
      title: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
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
    );
  }

  Container listViewTitle() {
    return Container(
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
    );
  }

  SizedBox listView(Size size) {
    return SizedBox(
      width: double.infinity,
      height: size.height / 1.85,
      child: ListView.separated(
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Container(
                width: double.infinity,
                height: 59,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(1000),
                    color: Colors.white,
                    border: Border.all(color: Colors.grey, width: 1)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Data",
                      style: listViewTextStyle,
                    ),
                    Text(
                      "Data",
                      style: listViewTextStyle,
                    ),
                    Text(
                      "Data",
                      style: listViewTextStyle,
                    ),
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return (index + 2) % 4 == 0
                ? Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Container(
                      width: double.infinity,
                      height: 59,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(1000),
                          color: SolidColors.adBackGroundColor,
                          border: Border.all(color: Colors.grey, width: 1)),
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
                  )
                : const SizedBox.shrink();
          },
          itemCount: 20),
    );
  }

  Container updateBox(Size size) {
    return Container(
      width: double.infinity,
      height: size.height / 16,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(1000),
          color: SolidColors.updateBoxColor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
              width: size.width / 3,
              height: double.maxFinite,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(1000),
                  color: SolidColors.updateBottomColor),
              child: TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.refresh_rounded,
                      color: SolidColors.updateBottonIconColor, size: 30),
                  label: Text("بروزرسانی", style: updateBottonTextStyle))),
          Text(
            "آخرین بروزرسانی",
            style: updateBoxTextStyle,
          ),
          Text(
            _getTime(),
            style: updateBoxTextStyle,
          ),
          SizedBox(
            width: size.width / 25,
          )
        ],
      ),
    );
  }

  String _getTime() {
    return "20:45";
  }
}
