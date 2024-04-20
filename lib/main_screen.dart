// ignore_for_file: must_be_immutable

import 'package:currency/component/my_colors.dart';
import 'package:currency/component/text_style.dart';
import 'package:currency/model/currency_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<CurrencyModel> currencyList = [];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    getResponse();

    return Scaffold(
      backgroundColor: SolidColors.backgroundColor,
      appBar: appBar(),
      body: LayoutBuilder(
        builder: (context, constraints) => Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
          child: SafeArea(
            child: Align(
              alignment: Alignment.center,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    //headline 1, first row of main body
                    ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 500),
                      child: Row(
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
                          ConstrainedBox(
                            constraints: const BoxConstraints(maxWidth: 200),
                            child: Text(
                              "نرخ ارز آزاد چیست؟",
                              style: headline1TextStyle.copyWith(
                                  color: SolidColors.headline1Color),
                            ),
                          )
                        ],
                      ),
                    ),
                    //description
                    ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 500),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ExpandableText(
                          "نرخ ارز ها از معاملات نقدی و رایج روزانه است. معاملات نقدی معاملاتی هستند که خریدار و فروشنده به محض انجام معامله، ارز و ریال را با هم تبادل می نمایند.",
                          maxLines: 2,
                          expandText: "show more",
                          collapseText: "show less",
                          style: descriptionTextStyle.copyWith(
                              color: SolidColors.descriptionColor),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    //list view title
                    listViewTitle(),
                    //list view
                    listView(
                      size,
                      constraints.maxHeight,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    //update box
                    updateBox(size)
                  ],
                ),
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
            width: 30,
            height: 30,
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
                  width: 30,
                  height: 30,
                ),
              )),
        )
      ]),
    );
  }

  listViewTitle() {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxWidth: 500,
      ),
      child: Container(
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
    );
  }

  listView(Size size, var maxHeightOfConstraints) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 500),
      child: SizedBox(
        width: double.infinity,
        height: maxHeightOfConstraints - 290,
        child: ListView.separated(
            itemBuilder: (context, index) {
              return myItem(index);
            },
            separatorBuilder: (context, index) {
              return (index + 2) % 5 == 0 ? ad() : const SizedBox.shrink();
            },
            itemCount: currencyList.length),
      ),
    );
  }

  Padding ad() {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
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
    );
  }

  Padding myItem(index) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
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
            alignText(currencyList[index].title!),
            alignText(currencyList[index].price!),
            alignText(currencyList[index].change!),
          ],
        ),
      ),
    );
  }

  SizedBox alignText(
    String myText,
  ) {
    return SizedBox(
      width: 100,
      child: Align(
        alignment: Alignment.center,
        child: Text(
          myText,
          style: listViewTextStyle,
        ),
      ),
    );
  }

  updateBox(Size size) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 500),
      child: Container(
        width: double.infinity,
        height: 55,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(1000),
            color: SolidColors.updateBoxColor),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 200, minWidth: 10),
              child: Container(
                  width: size.width / 2.8,
                  height: double.maxFinite,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(1000),
                      color: SolidColors.updateBottomColor),
                  child: TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.refresh_rounded,
                          color: SolidColors.updateBottonIconColor, size: 25),
                      label: Text("بروزرسانی", style: updateBottonTextStyle))),
            ),
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
      ),
    );
  }

  String _getTime() {
    return "20:45";
  }

  getResponse() {
    var url =
        "https://sasansafari.com/flutter/api.php?access_key=flutter123456";
    http.get(Uri.parse(url)).then((value) {
      if (currencyList.isEmpty){
        if (value.statusCode == 200) {
        List jsonList = convert.jsonDecode(value.body);
        if (jsonList.isNotEmpty) {
          for (int i = 0; i < jsonList.length; i++) {
            setState(() {
              currencyList.add(CurrencyModel(
                  id: jsonList[i]["id"],
                  title: jsonList[i]["title"],
                  price: jsonList[i]["price"],
                  change: jsonList[i]["changes"],
                  status: jsonList[i]["status"]));
            });
          }
        }
      }
      }
    });
  }
}
