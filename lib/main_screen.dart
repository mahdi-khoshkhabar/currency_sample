// ignore_for_file: must_be_immutable

import 'package:currency/component/my_colors.dart';
import 'package:currency/component/text_style.dart';
import 'package:currency/model/currency_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});
  List<CurrencyModel> currency = [];

  @override
  Widget build(BuildContext context) {
    currency.add(CurrencyModel(
        id: "1",
        title: "یورو",
        price: "691,900",
        change: "(0.75%) 5,160",
        status: "n"));
    currency.add(
      CurrencyModel(
          id: "2",
          title: "درهم امارات",
          price: "174,440",
          change: "(0.84%) 1,460",
          status: "n"),
    );
    currency.add(CurrencyModel(
        id: "3",
        title: "پوند انگلیس",
        price: "806,370",
        change: "(0.79%) 6,380",
        status: "n"));
    currency.add(CurrencyModel(
        id: "4",
        title: "لیر ترکیه",
        price: "20,050",
        change: "(1%) 200",
        status: "n"));
    currency.add(CurrencyModel(
        id: "5",
        title: "فرانک سویس",
        price: "704,300",
        change: "(1.19%) 8,400",
        status: "n"));
    currency.add(CurrencyModel(
        id: "6",
        title: "یوان چین",
        price: "88,200",
        change: "(0.79%) 700",
        status: "n"));
    currency.add(CurrencyModel(
        id: "7",
        title: "ین ژاپن",
        price: "420,210",
        change: "(0.95%) 3,980",
        status: "n"));
    currency.add(CurrencyModel(
        id: "8",
        title: "وون کره جنوبی",
        price: "470",
        change: "(2.13%) 10",
        status: "n"));
    currency.add(CurrencyModel(
        id: "9",
        title: "دلار کانادا",
        price: "470,700",
        change: "(0.85%) 4,000",
        status: "n"));
    currency.add(CurrencyModel(
        id: "10",
        title: "دلار استرالیا",
        price: "420,700",
        change: "(0.57%) 2,400",
        status: "n"));
    var size = MediaQuery.of(context).size;
    var listViewSpace = size.height / 60;

    return Scaffold(
      backgroundColor: SolidColors.backgroundColor,
      appBar: appBar(),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: SafeArea(
          child: Align(
            alignment: Alignment.center,
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
                    child: Text(
                      "نرخ ارز ها از معاملات نقدی و رایج روزانه است. معاملات نقدی معاملاتی هستند که خریدار و فروشنده به محض انجام معامله، ارز و ریال را با هم تبادل می نمایند.",
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
                listView(size, listViewSpace),
                SizedBox(
                  height: listViewSpace,
                ),
                //update box
                updateBox(size)
              ],
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
      constraints: const BoxConstraints(maxWidth: 500, minWidth: 100),
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

  listView(Size size, double listViewSpaceBetween) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 500, minWidth: 100),
      child: SizedBox(
        width: double.infinity,
        height: size.height / 2,
        child: ListView.separated(
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(top: listViewSpaceBetween),
                child: myItem(),
              );
            },
            separatorBuilder: (context, index) {
              return (index + 2) % 4 == 0
                  ? Padding(
                      padding: EdgeInsets.only(top: listViewSpaceBetween),
                      child: ad(),
                    )
                  : const SizedBox.shrink();
            },
            itemCount: currency.length),
      ),
    );
  }

  Container ad() {
    return Container(
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
    );
  }

  Container myItem() {
    return Container(
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
    );
  }

  updateBox(Size size) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 500, minWidth: 100),
      child: Container(
        width: double.infinity,
        height: size.height / 16,
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
}
