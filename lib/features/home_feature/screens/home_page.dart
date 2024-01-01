import 'package:flutter/material.dart';
import 'package:poolino/constants.dart';
import 'package:poolino/features/home_feature/screens/income_page.dart';
import 'package:poolino/features/home_feature/widgets/button_widget.dart';
import 'package:poolino/features/home_feature/widgets/transaction_widget.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_sms_inbox/flutter_sms_inbox.dart';
import 'package:page_transition/page_transition.dart';



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
  final SmsQuery _query = SmsQuery();
  List<SmsMessage> _messages = [];
  String extracted = "";


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
        padding: EdgeInsets.only(left: 16, right: 16, top: 36),
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
                height: 18,
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
                      requestPermission();
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text("ثبت درآمد"),),
                      );
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
                        onTapCustom: () async {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("ثبت هزینه دستی")));
                          Navigator.pop(context);

                          var permission = await Permission.sms.status;
                          if(permission.isGranted){
                            final messages = await _query.querySms(
                              kinds: [
                                SmsQueryKind.inbox,
                                SmsQueryKind.sent,
                              ],
                              address: '9830008528',
                              count: 10,
                            );

                            setState(() => _messages = messages);
                          }
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
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(12 )
                ),
                child: DefaultTabController(
                  length: 3,
                  child: TabBar(
                      controller: _tabController,
                      unselectedLabelStyle: const TextStyle(
                        fontFamily: "yekan_regular",
                      ),
                      unselectedLabelColor: Colors.black,

                      overlayColor: MaterialStateProperty.all<Color>(Colors.grey.shade400),
                      splashBorderRadius: BorderRadius.circular(12),
                      labelStyle: TextStyle(fontFamily: "yekan_regular"),
                      tabAlignment: TabAlignment.fill,
                      automaticIndicatorColorAdjustment: false,
                      indicatorColor: Colors.transparent,
                      labelColor: Colors.white,
                      dividerColor: Colors.transparent,
                      indicatorWeight: 1,
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicator: BoxDecoration(
                        color: hexToColor(Constants.baseColor),
                        borderRadius: BorderRadius.circular(12),
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
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 3,
                child: TabBarView(
                  controller: _tabController,
                  children:[
                    ListView.builder(
                      shrinkWrap: false,
                      itemCount: 6,
                      itemBuilder: (context, index) {

                        // return TransactionWidget(
                        //   price: getPrice(_messages[index].body.toString()),
                        //   title: _messages[index].address.toString(),
                        //   date: _messages[index].date.toString(),
                        //   state: _messages[index].body.toString().contains("خرید") ? 1 : 0,

                        return Expanded(
                          child: TransactionWidget(
                            price: prices[index],
                            title: titles[index],
                            date: "1402/10/11",
                            state: states[index].toInt(),
                            onTap: (){
                              Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: IncomePage()));
                            },

                          ),
                        );
                      },
                    ),
                    const Center(
                      child: Text("It's rainy here"),
                    ),
                    const Center(
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
String getPrice(String smsBody) {
  print(smsBody);
  List<String> amounts = [];

  RegExp regex = RegExp(r'(برداشت|واریز|مبلغ|خرید)[:\s]*([-+]?\d{1,15}(?:,\d{3})*(?:\.\d{2})?)');
  Iterable<Match> matches = regex.allMatches(smsBody);

  // چک کردن برای وجود match
  if (matches != null) {
    for (Match match in matches) {
      String word = match.group(1)!;
      String amount = match.group(2)!;
      amounts.add(amount);
    }
  } else {
    // اگر هیچ تطابقی پیدا نشد، می‌توانید یک مقدار پیش‌فرض یا پیام خطا بازگردانید
    return 'تطابق پیدا نشد.';
  }

  // اگر مقداری پیدا شده، لیست مقادیر را بازگردانید
  if (amounts.isNotEmpty) {
    return amounts.join(', '); // یا هر روش دیگری که برای نمایش لیست مناسب است
  } else {
    return 'تطابق پیدا نشد.';
  }
}



Future<void> requestPermission() async {
  const permission = Permission.sms;

  if (await permission.isDenied) {
    await permission.request();
  }
}

Color hexToColor(String code) {
  return Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
}
