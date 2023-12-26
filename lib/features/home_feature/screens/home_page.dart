import 'package:flutter/material.dart';
import 'package:poolino/constants.dart';
import 'package:poolino/features/home_feature/widgets/button_widget.dart';
import 'package:poolino/features/home_feature/widgets/transaction_widget.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';

import '../widgets/bottom_sheets/add_cost.dart';
import '../widgets/card_money.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widgets/toolbar_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  int hexToInteger(String hex) => int.parse(hex, radix: 16);
  late final TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<String> prices = [
      "1,230,000",
      "3,400,200",
      "500,000",
      "4,103,000",
      "8,000,000",
      "2,300,000"
    ];
    List<String> titles = [
      "خرید طلای آبشده",
      "پروژه برنامه نویسی",
      "هارد لپ تاپ",
      "مانیتور 27 سامسونگ",
      "لپ تاپ استوک",
      "رم 16 گیگ پی سی"
    ];
    List<int> states = [1, 2, 1, 1, 2, 2];

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 24, right: 24, top: 36),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ToolbarWidget(
                onTap: () {},
              ),
              const SizedBox(
                height: 18,
              ),
              CardMoney(
                cost: "15,000,330",
                income: "23,000,000",
                total: "120,000,000",
              ),
              const SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ButtonWidget(
                    name: "گزارش حساب",
                    icon: "report_blue",
                    onTap: () {},
                  ),
                  ButtonWidget(
                    name: "ثبت درآمد",
                    icon: "income_blue",
                    onTap: () {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text("ثبت درآمد")));
                    },
                  ),
                  ButtonWidget(
                    name: "ثبت هزینه",
                    icon: "cost_blue",
                    onTap: () {
                      AddCost add = AddCost();
                      add.showModal(
                        context,
                        onTapChoose: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("ثبت هزینه انتخابی")));
                          Navigator.pop(context);
                        },
                        onTapCustom: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("ثبت هزینه دستی")));
                          Navigator.pop(context);
                        },
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "مشاهده همه (${states.length})",
                    style: const TextStyle(
                        fontFamily: "yekan_bold",
                        fontSize: 16,
                        color: Colors.blue),
                  ),
                  const Text(
                    "تراکنش های اخیر",
                    style: TextStyle(
                        fontFamily: "yekan_bold",
                        fontSize: 16,
                        color: Colors.black),
                  )
                ],
              ),
              const SizedBox(
                height: 18,
              ),
              DefaultTabController(
                length: 3,
                child: TabBar(
                    controller: _tabController,
                    unselectedLabelStyle: const TextStyle(
                      fontFamily: "yekan_regular",
                    ),
                    unselectedLabelColor: Colors.black,
                    overlayColor: MaterialStateProperty.all<Color>(Colors.grey.shade400),
                    splashBorderRadius: BorderRadius.circular(10),
                    labelStyle: TextStyle(fontFamily: "yekan_regular"),
                    indicator: BoxDecoration(
                      color: hexToColor(Constants.baseColor),
                      borderRadius: BorderRadius.circular(10),
                    ),

                    onTap: (int index){
                      
                    },

                    tabs: const [
                      Tab(
                        text: "درآمد",
                      ),
                      Tab(
                        text: "هزینه",
                      ),
                      Tab(
                        text: "نامشخص",
                      ),
                    ]),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 3,
                child: TabBarView(
                  controller: _tabController,
                  children: <Widget>[
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: 6,
                      itemBuilder: (context, index) {
                        return TransactionWidget(
                          price: prices[index],
                          title: titles[index],
                          date: "یکشنبه ۱۲ آذر ۱۴۰۲ ۱۹۲۰",
                          state: states[index],
                        );
                      },
                    ),
                    Center(
                      child: Text("It's rainy here"),
                    ),
                    Center(
                      child: Text("It's sunny here"),
                    ),
                  ],
                ),
              ),

              /*ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 3,
                itemBuilder: (context, index) {
                  return TransactionWidget(
                    price: prices[index],
                    title: titles[index],
                    date: "یکشنبه ۱۲ آذر ۱۴۰۲ ۱۹۲۰",
                    state: states[index],
                  );
                },
              ),*/
            ],
          ),
        ),
      ),
    );
  }
}

Color hexToColor(String code) {
  return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
}
